input metauml;
beginfig(1);
	Class.W("Writter")(
	)(
		"Send()"
	);

	Class.R("Reader")(
	)(
		"Read()"
	);

	Class.HPPP("ParkPilot")(
	)(
		"calculateNewSetpoint()"
	);

	Class.HPPPb("CentralizedParkPilot")(
	)(
		"calculateNewSetpoint()"
	);

	Class.HPPPa("DecentralizedParkPilot")(
	)(
		"calculateNewSetpoint()"
	);

	Class.T("Turbine")(
	)(
		"sendSetpoint(setPoint)",
		"readTurbineData(&maxProduction, &currentProduction)"
	);

	Class.TS("TurbineSimulator")(
		"-prevMaxProduction",
		"-prevProduction"
	)(
		"calculate(setpunkt, maxProduction): currentProduction"
	);


	Class.DB("DatabaseReader")(
	)(
		"getNextValue(): maxProduction"
	);


	rightToLeft(30)(W, R);
	rightToLeft(30)(TS, DB);
	topToBottom(30)(HPPPa, HPPPb);

	Group.WR(W, R);
	Group.DBTS(DB, TS);
	Group.HPPPab(HPPPa, HPPPb);

	topToBottom(30)(WR, HPPPa);
	topToBottom(40)(HPPPa, T);
	topToBottom(30)(T, DBTS);

	leftToRight(30)(HPPPab, HPPP);

	drawObjects(T, HPPPa, WR, DBTS);%, HPPPab);

	clink(association)(R, HPPPa);
	clink(association)(W, HPPPa);
	clink(association)(T, HPPPa);
	clink(association)(T, TS);
	clink(association)(T, DB);
%	clink(association)(HPPPa, HPPP);
%	clink(association)(HPPPb, HPPP);
endfig;
end