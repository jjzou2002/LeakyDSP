// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

#include "zynq_ultra_ps_e_tlm.h"

/***************************************************************************************
*   Global method, get registered with tlm2xtlm bridge
*   This function is called when tlm2xtlm bridge convert tlm payload to xtlm payload.
*
*   caller:     tlm2xtlm bridge
*   purpose:    To get master id and other parameters out of genattr_extension 
*               and use master id to AxUSER PIN of xtlm payload.
*
*
***************************************************************************************/

void get_extensions_from_tlm(xtlm::aximm_payload* xtlm_pay, const tlm::tlm_generic_payload* gp)
{
    if((xtlm_pay == NULL) || (gp == NULL))
        return;
    if((gp->get_command() == tlm::TLM_WRITE_COMMAND) && (xtlm_pay->get_awuser_size() > 0))
    {
        genattr_extension* ext = NULL;
        gp->get_extension(ext);
        if(ext == NULL)
            return;
        //Portion of master ID(master_id[5:0]) are transfered on AxUSER bits(refere Zynq UltraScale+ TRM page.no:414)
        uint32_t val = ext->get_master_id() && 0x3F;
        unsigned char* ptr = xtlm_pay->get_awuser_ptr();
        unsigned int size  = xtlm_pay->get_awuser_size();
        *ptr = (unsigned char)val;

    }
    else if((gp->get_command() == tlm::TLM_READ_COMMAND) && (xtlm_pay->get_aruser_size() > 0))
    {
        genattr_extension* ext = NULL;
        gp->get_extension(ext);
        if(ext == NULL)
            return;
        //Portion of master ID(master_id[5:0]) are transfered on AxUSER bits(refere Zynq UltraScale+ TRM page.no:414)
        uint32_t val = ext->get_master_id() && 0x3F;
        unsigned char* ptr = xtlm_pay->get_aruser_ptr();
        unsigned int size  = xtlm_pay->get_aruser_size();
        *ptr = (unsigned char)val;
    }
}

/***************************************************************************************
*   Global method, get registered with xtlm2tlm bridge
*   This function is called when xtlm2tlm bridge convert xtlm payload to tlm payload.
*
*   caller:     xtlm2tlm bridge
*   purpose:    To create and add master id and other parameters to genattr_extension.
*               Master id red from AxID PIN of xtlm payload.
*
*
***************************************************************************************/
void add_extensions_to_tlm(const xtlm::aximm_payload* xtlm_pay, tlm::tlm_generic_payload* gp)
{
    if(gp == NULL)
        return;
    uint8_t val = 0;
    if((gp->get_command() != tlm::TLM_WRITE_COMMAND) && (gp->get_command() != tlm::TLM_READ_COMMAND))
        return;
    //portion of master ID bits(master_id[5:0]) are derived from the AXI ID(AWID/ARID). (refere Zynq UltraScale+ TRM page.no:414,415)
    //val = (*(uint8_t*)(xtlm_pay->get_axi_id())) && 0x3F;
    genattr_extension* ext = new genattr_extension;
    ext->set_master_id(val);
    gp->set_extension(ext);    
    gp->set_streaming_width(gp->get_data_length());
    if(gp->get_command() != tlm::TLM_WRITE_COMMAND)
    {
        gp->set_byte_enable_length(0);
        gp->set_byte_enable_ptr(0);
    }
}

    zynq_ultra_ps_e_tlm :: zynq_ultra_ps_e_tlm (sc_core::sc_module_name name,
    xsc::common_cpp::properties&): sc_module(name)//registering module name with parent
        ,maxihpm0_lpd_aclk("maxihpm0_lpd_aclk")
        ,pl_resetn0("pl_resetn0")
        ,pl_clk0("pl_clk0")
        ,pl_clk1("pl_clk1")
        ,pl_clk2("pl_clk2")
        ,pl_clk3("pl_clk3")
        ,pl_clk0_clk("pl_clk0_clk", sc_time(3.3333665669980066,sc_core::SC_NS))//clock period in nanoseconds = 1000/freq(in MZ)
        ,pl_clk1_clk("pl_clk1_clk", sc_time(3.3333665669980066,sc_core::SC_NS))//clock period in nanoseconds = 1000/freq(in MZ)
        ,pl_clk2_clk("pl_clk2_clk", sc_time(3.3333665669980066,sc_core::SC_NS))//clock period in nanoseconds = 1000/freq(in MZ)
        ,pl_clk3_clk("pl_clk3_clk", sc_time(3.3333665669980066,sc_core::SC_NS))//clock period in nanoseconds = 1000/freq(in MZ)
    {
        //creating instances of xtlm slave sockets

        //creating instances of xtlm master sockets
        M_AXI_HPM0_LPD_wr_socket = new xtlm::xtlm_aximm_initiator_socket("M_AXI_HPM0_LPD_wr_socket", 32);
        M_AXI_HPM0_LPD_rd_socket = new xtlm::xtlm_aximm_initiator_socket("M_AXI_HPM0_LPD_rd_socket", 32);

        char* tcpip_addr = getenv("COSIM_MACHINE_TCPIP_ADDRESS");
        if(tcpip_addr == NULL)  {
            tcpip_addr = "NO_IP_ADDRESS";
            //std::cerr << "ERROR: Environment Variable COSIM_MACHINE_TCPIP_ADDRESS is not specified.\n Please Specify COSIM_MACHINE_TCPIP_ADDRESS for TCP Socket Communication.\n" << std::endl;
            //exit(0);
        }
        char* skt_name = strdup(tcpip_addr);
        m_zynqmp_tlm_model = new xilinx_zynqmp("xilinx_zynqmp",skt_name);

        m_xtlm2tlm = new xtlm::xaximm_xtlm2tlm*[9];
        m_tlm2xtlm = new xtlm::xaximm_tlm2xtlm*[3];
        for(int index = 0; index < 9; index++)  {
            m_xtlm2tlm[index] = NULL;
            if(index < 3)
                m_tlm2xtlm[index] = NULL;
        }

        
        //instantiating TLM2XTLM bridge and stiching it between 
        //s_axi_hpm_lpd initiator socket of zynqmp Qemu tlm wrapper to M_AXI_HPM0_LPD_wr_socket/rd_socket sockets 
        m_tlm2xtlm[2] = new xtlm::xaximm_tlm2xtlm("M_AXI_HPM0_LPD_tlm2xtlm_bg",32);
        m_tlm2xtlm[2]->wr_socket->bind(*M_AXI_HPM0_LPD_wr_socket);
        m_tlm2xtlm[2]->rd_socket->bind(*M_AXI_HPM0_LPD_rd_socket);
        m_tlm2xtlm[2]->target_socket.bind(*m_zynqmp_tlm_model->s_axi_hpm_lpd);

        m_zynqmp_tlm_model->tie_off();

        SC_METHOD(trigger_pl_clk0_pin);
        sensitive << pl_clk0_clk;
        dont_initialize();
        SC_METHOD(trigger_pl_clk1_pin);
        sensitive << pl_clk1_clk;
        dont_initialize();
        SC_METHOD(trigger_pl_clk2_pin);
        sensitive << pl_clk2_clk;
        dont_initialize();
        SC_METHOD(trigger_pl_clk3_pin);
        sensitive << pl_clk3_clk;
        dont_initialize();
        
        m_tlm2xtlm[2]->registerUserExtensionHandlerCallback(&get_extensions_from_tlm);

        m_zynqmp_tlm_model->rst(qemu_rst);

    }

    zynq_ultra_ps_e_tlm :: ~zynq_ultra_ps_e_tlm ()    {
        //deleteing dynamically created objects 
        delete M_AXI_HPM0_LPD_wr_socket;
        delete M_AXI_HPM0_LPD_rd_socket;
        delete m_tlm2xtlm[2];
        delete[] m_tlm2xtlm;
        delete[] m_xtlm2tlm;
    }
    
    //Method which is sentive to pl_clk0_clk sc_clock object
    //pl_clk0 pin written based on pl_clk0_clk clock value 
    void zynq_ultra_ps_e_tlm ::trigger_pl_clk0_pin()    {
        pl_clk0.write(pl_clk0_clk.read());
    }
    //Method which is sentive to pl_clk1_clk sc_clock object
    //pl_clk1 pin written based on pl_clk1_clk clock value 
    void zynq_ultra_ps_e_tlm ::trigger_pl_clk1_pin()    {
        pl_clk1.write(pl_clk1_clk.read());
    }
    //Method which is sentive to pl_clk2_clk sc_clock object
    //pl_clk2 pin written based on pl_clk2_clk clock value 
    void zynq_ultra_ps_e_tlm ::trigger_pl_clk2_pin()    {
        pl_clk2.write(pl_clk2_clk.read());
    }
    //Method which is sentive to pl_clk3_clk sc_clock object
    //pl_clk3 pin written based on pl_clk3_clk clock value 
    void zynq_ultra_ps_e_tlm ::trigger_pl_clk3_pin()    {
        pl_clk3.write(pl_clk3_clk.read());
    }

    //pl_resetn0 output reset pin get toggle when emio bank 2's 31th signal gets toggled
    //EMIO[2] bank 31th(GPIO[95] signal)acts as reset signal to the PL(refer Zynq UltraScale+ TRM, page no:761)
    void zynq_ultra_ps_e_tlm ::pl_resetn0_trigger()   {
        pl_resetn0.write(m_zynqmp_tlm_model->emio[2]->out[31].read());
    }

    sc_signal<bool> qemu_rst;
    void zynq_ultra_ps_e_tlm ::start_of_simulation()
    {
    //temporary fix to drive the enabled reset pin 
        pl_resetn0.write(true);
        qemu_rst.write(false);
    }

