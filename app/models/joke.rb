class Joke < ActiveRecord::Base
	JOKES_LIST = ["I want to die peacefully in my sleep, like my grandfather... Not screaming and yelling like the passengers in his car.",
							 "Can a kangaroo jump higher than a house? Of course, a house doesn’t jump at all.",
							 "I think my neighbor is stalking me as she's been googling my name on her computer. I saw it through my telescope last night.",
							 'I hate when I am about to hug someone really sexy and my face hits the mirror.',
							 'When wearing a bikini, women reveal 90% of their body... men are so polite they only look at the covered parts.',
							 'Refusing to go to the gym counts as resistance training, right?',
							 'You know that tingly little feeling you get when you like someone? That\'s your common sense leaving your body.',
							 'What\'s the difference between your wife and your job? After five years your job will still suck.',
							 'How do I disable the autocorrect function on my wife?',
							 'Just read that 4,153,237 people got married last year, not to cause any trouble but shouldn\'t that be an even number?',
							 'Life is all about perspective. The sinking of the Titanic was a miracle to the lobsters in the ship\'s kitchen.',
							]
	def self.pick_joke
		JOKES_LIST.sample
	end
end