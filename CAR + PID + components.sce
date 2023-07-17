scheme = "Car + PID + components.zcos";

// Simulate first
importXcosDiagram(scheme);
typeof(scs_m); //The diagram data structure
ctx = ["m = 1000; b = 1; kp = 30; ki = 2; kd = 100; T = 0.1; T_c = 5; stp = 30; std_noise = 1;"];

scs_m.props.context = ctx;
xcos_simulate(scs_m, 4);

// Draw
subplot(212);
h = plot(u_out.time, u_out.values, 'b-', pc_out.time, pc_out.values, 'g-', ic_out.time, ic_out.values, 'r-', dc_out.time, dc_out.values, 'k-', 'LineWidth',3);
l = legend("PID command", "Proportional component", "Integral component", "Derivative component");
l.font_size = 3;
ax=gca(),// gat the handle on the current axes
ax.data_bounds=[0 -500;150 2000];
set(gca(),"grid",[1 1]);
xlabel('t[s]', 'font_style', 'times bold', 'font_size', 3);
ylabel('F [N]', 'font_style', 'times bold', 'font_size', 3);

subplot(211);
h = plot(y_out.time, y_out.values, 'b-', stp_out.time, stp_out.values, 'r-', 'LineWidth',3);
l = legend("Response", "Setpoint");
l.font_size = 3;
ax=gca(),// gat the handle on the current axes
ax.data_bounds=[0 0;150 35];
set(gca(),"grid",[1 1]);
xlabel('t[s]', 'font_style', 'times bold', 'font_size', 3);
ylabel('Speed [m/s]', 'font_style', 'times bold', 'font_size', 3);
