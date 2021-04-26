# vhdl_moore_hcsr04
A Moore State Machine which calculates distance using HC-SR04 module, written in VHDL.<br>

### Design:
The design is based on a state machine that calculates distances using an external HC-SR04 module.<br>
When a calculation is complete, the data processed and passed on to two 7-segment displays.<br>
The state machine is based on a Moore design where the signal transmission to the registers is synchronous, with four inputs and seven outputs.

### I/Os
<table>
  <tr>
    <th>Port</th>
    <th>In / Out</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>i_clk_50</td>
    <td>Input</td>
    <td>std_logic</td>
    <td>Internal 50MHz CLK</td>
  </tr>
  <tr>
    <td>i_reset_n</td>
    <td>Input</td>
    <td>std_logic</td>
    <td>Asynchronous reset</td>
  </tr>
  <tr>
    <td>i_fsm</td>
    <td>Input</td>
    <td>std_logic_vector(1 downto 0)</td>
    <td>Reads pushbutton</td>
  </tr>
  <tr>
    <td>i_sonar_echo</td>
    <td>Input</td>
    <td>std_logic</td>
    <td>HC-SR04, echo signals</td>
  </tr>
  <tr>
    <td>o_sonar_trig</td>
    <td>Output</td>
    <td>std_logic</td>
    <td>HC-SR04, trig signals</td>
  </tr>
  <tr>
    <td>o_led0</td>
    <td>Output</td>
    <td>std_logic</td>
    <td>State Machine status, clear_state</td>
  </tr>
  <tr>
    <td>o_led1</td>
    <td>Output</td>
    <td>std_logic</td>
    <td>State Machine status, idle_state</td>
  </tr>
  <tr>
    <td>o_led2</td>
    <td>Output</td>
    <td>std_logic</td>
    <td>State Machine status, hcsr_state / end_state</td>
  </tr>
  <tr>
    <td>o_led9</td>
    <td>Output</td>
    <td>std_logic</td>
    <td>State Machine status, error_state</td>
  </tr>
  <tr>
    <td>o_seg_cms</td>
    <td>Output</td>
    <td>std_logic_vector(7 downto 0)</td>
    <td>Presents centimeters on 7-seg display</td>
  </tr>
  <tr>
    <td>o_seg_cms</td>
    <td>Output</td>
    <td>std_logic_vector(7 downto 0)</td>
    <td>Presents decimeters on 7-seg display</td>
  </tr>
