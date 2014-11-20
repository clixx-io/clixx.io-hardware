Digital Button
==============

.. image:: images/Button-Board.png

The Digital Button is a handy general purpose button board for using
in places where you need to add one or more input-buttons to a project.

The advantages of this Button board is that it can plug directly into
a Clixx.IO Dock or be attached with an extension cable and be mounted
in a convenient physical location such as on any flat surface, like next
to a door for instance.

Any programming language can be used depending on your platform and the
button works as a Digital Input device meaning that a value of 0 indicates
off and a non-zero value means that the button is depressed.

You can typically add more than one Digital Button to a circuit and
combine them with other electronics such as LED's or switches to make
them do useful tasks.

Usage
^^^^^

Any project where you need to add one or more Push Buttons.

When pressed, it turns the Output Pin (marked 'o' on the Button board
and 'i' on the Dock) high. 

Connection
^^^^^^^^^^

This board can be plugged into any Digital-Slot.

Code Example
^^^^^^^^^^^^

.. code-block:: python

	'''
	  ButtonInput
	  Scans the input button and waits for a change, repeatedly.

	  This example code is in the public domain.
	 '''

	# Pin 2 has an Input button connected to it.
	# give it a name:
	button = 2
	button_state = False

	# the setup routine runs once when you press reset:
	def setup():
	  global button, button_state
	  
	  # initialize the digital pin as an output.
	  pinMode(button, INPUT)

	# the loop routine runs over and over again forever:
	def loop():
	  global button, button_state
	  
	  i = digitalRead(button)      # turn the LED on (HIGH is the voltage level)
	  if i != button_state:
		  print "Button is now %d" % i
		  button_state = i
		  
Circuit
^^^^^^^

The circuit includes a Button with a 2K Resistor.

Modifications
^^^^^^^^^^^^^

This board includes a work-area at the top for soldering on extra components.
