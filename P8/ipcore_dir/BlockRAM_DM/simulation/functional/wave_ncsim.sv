

 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /BlockRAM_DM_tb/status
      waveform add -signals /BlockRAM_DM_tb/BlockRAM_DM_synth_inst/bmg_port/CLKA
      waveform add -signals /BlockRAM_DM_tb/BlockRAM_DM_synth_inst/bmg_port/ADDRA
      waveform add -signals /BlockRAM_DM_tb/BlockRAM_DM_synth_inst/bmg_port/DINA
      waveform add -signals /BlockRAM_DM_tb/BlockRAM_DM_synth_inst/bmg_port/WEA
      waveform add -signals /BlockRAM_DM_tb/BlockRAM_DM_synth_inst/bmg_port/DOUTA

console submit -using simulator -wait no "run"
