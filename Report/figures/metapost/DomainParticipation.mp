input metauml;
beginfig(1);

	Begin.b;
	State.reading("Reading commands")();
	State.processing("Processing commands")();
	End.e;

	State.composite("Centralised ")(b, reading, processing, e);
	composite.info.left := composite.info.right := 10;
	composite.info.drawNameLine := 1;

	topToBottom(20)(b, reading, processing, e);
	drawObject(composite);

	clink(transition)(b, reading);
	clink(transition)(reading, processing);
	clink(transition)(processing, e);

	ExitPoint.exit;
	exit.c=(composite.right, reading.midy);
	drawObject(exit);
	item(iAssoc)("error")(obj.nw = exit.s);

	clink(transition)(reading, exit);

	State.error("Preparing error report")();
	State.result("Writing result")();
	End.theEnd;

	topToBottom(20)(error, result, theEnd);
	leftToRight(30)(exit, error);

	drawObjects(error, result, theEnd);

	clink(transition)(exit, error);
	clink(transition)(error, result);
	clink(transition)(result, theEnd);

	link(transition)(rpathHorizontal(result.w, composite.right));

endfig;
end
