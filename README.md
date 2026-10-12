![Stars](https://img.shields.io/github/stars/harshbg/Sign-Language-Interpreter-using-Deep-Learning.svg?style=social)
![Forks](https://img.shields.io/github/forks/harshbg/Sign-Language-Interpreter-using-Deep-Learning.svg?style=social)
![GitHub contributors](https://img.shields.io/github/contributors/harshbg/Sign-Language-Interpreter-using-Deep-Learning.svg)
![Language](https://img.shields.io/github/languages/top/harshbg/Sign-Language-Interpreter-using-Deep-Learning.svg)
[![GitHub](https://img.shields.io/github/license/harshbg/Sign-Language-Interpreter-using-Deep-Learning.svg)](https://choosealicense.com/licenses/mit)
[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fharshbg%2FSign-Language-Interpreter-using-Deep-Learning&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)


# Sign Language Interpreter using Deep Learning

## Sign Studio v3 — Aarav and the ASL vocabulary prototype

Sign Studio provides a responsive browser interface with **Aarav**, the existing textured male human avatar, an ordered playback queue, explicit vocabulary coverage, speech controls, and saved conversation history. The avatar is preserved rather than replaced: its MIT-licensed Microsoft Rocketbox rig includes shoulders, elbows, wrists, and three joints per finger. The renderer improves material shading, mirrored finger flexion, transitions, and camera framing around the face, both hands, and signing space.

**This is an ASL vocabulary prototype with a strict review gate, not accurate sentence translation.** Validated mode is the default and currently has **zero approved clips**. Four recorded research previews and six legacy procedural demos require explicit opt-in; all remain unvalidated. The original project targets American Sign Language. English, Hindi, Spanish, French, Bengali, and Tamil choose appearance tints, display labels, and speech locale; they do not choose a different sign language or convert ASL grammar. Aarav keeps his name in every language. Unsupported words receive no invented movement or fingerspelling.

The expanded library contains **122 candidate concepts, 141 English aliases, 122 inflections, and 78 recorded motion assets**. Seventy-four new motions are **inspection-only**, excluded from automatic text translation. A separate searchable catalog indexes **938 ASL archive files**; it is discovery metadata, not 938 verified signing words. Inspect a new asset from **Research → Phrase library**. Sources, licenses and missing review are visible for every motion. See [the import report](docs/IMPORT_REPORT.md), [repository audit](docs/REPOSITORY_AUDIT.md), and [human review worklist](docs/ASL_REVIEW_WORKLIST.md).

The library's **Imported assets awaiting review** section now supports manual
inspection in any vocabulary mode. Filter by topic/search, select recordings
in order, then **Inspect selected motions**. Remove or clear selections and
replay complete inspection queues from history. **Playback position** lets you
scrub recorded frames, including idle lead-ins, without trimming source data.
These actions do not translate a sentence or approve a sign. The latest
61-test verification and 50-motion batch are documented in
[EVERYDAY_EXPANSION.md](docs/EVERYDAY_EXPANSION.md), with the
[current human worklist](docs/ASL_FINAL_EVERYDAY_REVIEW_WORKLIST.md).

### Setup and run

Install **Node.js 22.13 or newer**, then run these commands from the repository root:

```sh
npm install
npm run check
npm test
npm start
```

Open [the local studio](http://127.0.0.1:3000/). The server binds only to loopback. Set the `SIGN_PORT` environment variable before starting to use another port. Alternatively, use the included pnpm lockfile with `pnpm install`, `pnpm run check`, `pnpm test`, and `pnpm start`. The browser demo requires WebGL and does not require Python, API keys, a paid speech service, or the original CNN assets.

On Windows, double-click `start-studio.cmd` after installing dependencies. It finds Node on PATH or the bundled Codex runtime. Keep its server window open while using the app; press Ctrl+C to stop. If the server stops, start it again and select **Reconnect studio** or reload the page. SQLite history and preferences survive server restarts. Run one server per port.

`npm run check` validates JavaScript syntax, HTML element references, canonical vocabulary invariants and immutable local asset hashes. `npm test` runs phrase, queue, meaning/correction, dedup/import, API, storage, avatar and speech-controller regression tests. The expanded automated run passed **61 tests**, including all 78 motions on the real skinned rig at desktop/mobile sizes. Current browser results are in [docs/VOCABULARY_VERIFICATION.md](docs/VOCABULARY_VERIFICATION.md); [docs/VERIFICATION.md](docs/VERIFICATION.md) preserves the earlier baseline. API tests open temporary loopback servers; environments that block localhost connections must allow them. Automated speech tests use browser API doubles and do not verify a physical speaker, microphone or provider transcription service. Test those functions on the intended browser/device.

### Using the studio

Type a greeting, a sentence, or a paragraph and build its coverage result. Choose the vocabulary mode deliberately:

| Mode | Current vocabulary | Expected behavior |
| --- | --- | --- |
| **Validated** — default | 0 approved clips | Input is processed and saved; uncertain motions are excluded and missing/pending coverage is explained. An empty queue is the expected result until review is complete |
| **Research** — explicit opt-in | 3D-LEX `help`, `yes`, `no`, and `love` lexical motion previews | Exact English source glosses; recorded motion on Aarav remains under technical/ASL review. Choose meanings for ambiguous terms before they enter the queue |
| **Demo** — explicit opt-in | Hello, Thank you, Yes, No, Help, I love you | Six retained procedural illustrations with translated labels and existing input aliases; useful for control testing, not approved signing |

Research `no` requires the **negative answer/refusal** sense and `love` requires **affection**. Unknown or unselected senses remain unsupported. Use isolated `Love.` to inspect the affection clip. The complete expression `I love you` has a distinct concept and is held in Research until its own mapping/animation is reviewed; it no longer falls back to the lexical LOVE preview. The legacy illustration remains in Demo. Negated clauses such as `I do not want help` are held so they cannot become positive HELP by dropping negative words. The source `hello.glb` had no animation, and `thank_you.glb` was absent; recorded greetings are not fabricated.

The meaning pipeline preserves the complete original input and its source offsets, resolves longest phrases first, then considers concepts/senses within a sentence. `I need hepl` proposes and contextually applies `help`; **Undo & rebuild**, **Apply & rebuild** and **Edit interpreted text** let you correct it. Other unfamiliar words receive suggestions only; names, numbers and negation are protected. Financial bank/riverbank, illumination/light weight, and rightward/correct remain separate concepts. Insufficient context shows a focused choice for each source occurrence. Context-selected meanings remain editable. English aliases such as `assistance` are candidate HELP meanings but cannot enable a clip until their ASL equivalence is reviewed. Inflections keep their source tense and do not silently substitute a base sign. No paid semantic API is used.

**Phrase support** explains every input segment: which word previews can play,
which terms have no enabled motion, which clips await review and whether a
complete reviewed phrase template exists. `I need help` playing only HELP is a
partial vocabulary preview, not a translated phrase. See
[why phrases do not yet work and the next implementation requirements](docs/PHRASE_SUPPORT.md).

Within the chosen mode, the server matches whole words and longest available phrases, preserving their order and exact source positions. For example, **Demo** `Hello, please help. Thank you!` queues Hello → Help → Thank you and reports `please` as missing. **Validated** excludes those unreviewed clips. Changing modes stops/clears the old queue, and history is reviewed through the current gate rather than silently approving a saved animation. The registry and review requirements are documented in [SIGN_DATA_VALIDATION.md](SIGN_DATA_VALIDATION.md).

Input supports **up to 10,000 words and 100,000 characters**, including multi-sentence English, punctuation, and the complete 500-word example available in the interface. There is no 12-phrase limit. The complete original text, including spacing and punctuation, is retained in the result, history, and export. Coverage includes each unsupported term and its source position. Long queue and coverage displays initially show a labeled subset with **Show more** or **Show full highlighted message** controls; this affects display only. Inputs exceeding a limit fail with an explicit error and are never silently truncated. An entirely unsupported message is still saved and reported, but has an empty playback queue.

Use **Play, Pause, Resume, Replay, Stop**, and playback speed to control the queue. The viewer displays the current source phrase, its position in the queue, progress, and elapsed motion time. Time is measured on the motion timeline; playback speed changes the real duration. Stop retains the processed queue for replay. Repeated submissions stop the previous animation and speech before loading a new result. The studio suspends rendering when hidden and restores it when visible.

**Speech output** uses available browser speech synthesis. Choose a voice, rate, and volume; mute or stop speech independently. The voice list prefers an available voice for the selected locale, including natural/neural voice names when installed or supplied by the browser. Voice quality and availability depend on the browser and operating system; the default browser voice is the fallback. **Read message** reads the original input, and automatic speech is optional. Long speech is split into sequential chunks while preserving the text. Rate, volume, and voice selections apply when starting a new reading. Some browser voices require a network connection.

**Microphone** input uses browser SpeechRecognition where available. Start listening, stop recording, review and edit the transcript, then select **Use reviewed text**. This copies it into the composer without submitting or signing automatically; further corrections remain possible before building the queue. Recording/transcription states and permission failures are displayed, and typed input remains available. Recognition may use the browser vendor's speech service.

**Camera** is a separate basic hand-pose demonstration. Its legacy-pose checkbox must be explicitly enabled; this sends detections in **Demo** mode regardless of the text vocabulary selection. It does not provide continuous ASL recognition or approved vocabulary. MediaPipe's pretrained recognizer and model are served locally. Open palm, thumbs up/down, victory, and the I-love-you pose can trigger a demonstration after confidence and stability checks. Release the pose between repeated responses. Video stays in the browser; only the recognized pose label and confidence go to the local server. Camera tracks stop when changing input mode, leaving the studio, opening About, or hiding the page. The avatar and gesture model are local; network is needed only for optional Google Fonts or browser speech services.

### Backend and storage

`server.mjs` serves the app and JSON API. `web/sign-registry.mjs` records licensed sources, meaning boundaries, asset URLs, and review status. `backend/catalog.mjs` enforces mode/review gates and builds queues with coverage metadata; client-supplied approval flags cannot bypass it. `backend/store.mjs` uses Node's built-in SQLite driver and prepared statements. The database is created automatically at `data/sign-studio.sqlite` and is ignored by Git. Anonymous browser sessions use a random HttpOnly/SameSite cookie whose token is hashed in storage. Language, playback speed, and the last 200 successful conversations per session survive server restarts. History can be reviewed/replayed, exported as JSON, or cleared after confirmation. Saved messages, including legacy expressive conversations, are reprocessed through the current mode and meaning selections rather than replaying unreviewed saved motions automatically.

| Endpoint | Method | Behavior |
| --- | --- | --- |
| `/api/health` | GET | Server and storage status |
| `/api/catalog` | GET | Languages, avatar variants, vocabulary, capabilities, limits |
| `/api/session` | POST | Create or resume an anonymous session |
| `/api/session` | GET / PATCH | Read or save language and playback speed |
| `/api/translations` | POST | Validate text/voice or camera events, build and store a queue |
| `/api/history` | GET / DELETE | Read or clear this session's history |
| `/api/history/export` | GET | Download this session's complete saved payloads as JSON |

Start a session first and retain its cookie. A request without `vocabularyMode`, such as `{ "text": "Hello. Thank you.", "language": "hi", "mode": "text" }`, uses **validated** mode and currently returns an empty queue with explicit missing coverage. To test the old illustrations, explicitly add `"vocabularyMode": "demo"`. A recorded preview request can use `{ "text": "Help. Yes. No. Love.", "language": "en", "mode": "text", "vocabularyMode": "research", "senses": { "no": "negative-answer", "love": "affection" } }`. `mode: "voice"` uses the same mapper for reviewed transcripts. Text/voice responses use `responseType: "vocabulary"` and include:

- `input`: complete original text; `interpretedText`: text after applied spelling corrections; `interpretation`: corrections, candidate concepts, per-occurrence clarifications, held clauses and template/prototype plans; `output`: available preview labels.
- `sequence`: eligible ordered entries with animation ID, localized label, duration, original source text, word/character spans, source/license metadata, and technical/human review status.
- `timeline`: supported phrase and unsupported word entries in original input order.
- `unsupported`: every missing word with its position and reason, such as pending validation or ambiguity; `unsupportedTerms`: distinct terms, occurrence counts, and word positions.
- `ambiguousTerms`: meaning-selection requirements and the available sense IDs; no uncertain meaning is chosen automatically.
- `coverage`: total words, available words, missing words, phrase count, and preview coverage percentage.
- `playback`: initial index, queue length, and duration; `vocabularyMode` records the selected gate. `signLanguage: "ASL"`, `validatedSignLanguage: false`, and `fingerspelling: false` describe the current scope.

Word indices are zero-based; end indices are exclusive. Character offsets use JavaScript UTF-16 positions and exclusive ends. The browser and backend use the same Unicode-aware word counting, including contractions as single words. Every existing sequence entry has `validated: false`.

Camera demo requests take `{ "mode": "camera", "gesture": "Thumb_Up", "confidence": 0.9, "language": "hi", "vocabularyMode": "demo" }` and return `responseType: "camera-demo"` with an explicit recognition limitation. Without explicit Demo mode, no pose motion enters the queue. The frontend renews a missing session, times out failed requests, and loads history independently from the avatar. Errors include a JSON `error` field with HTTP 400/401/413/415/422/429 as appropriate. JSON requests are bounded to **1 MiB**, separately from the text/word limits. Host and Origin are restricted, API calls are rate-limited, and static files are limited to public directories. This local session model is not a public multi-user account system; public deployment requires authentication, TLS, and deployment-specific configuration.

### Limitations and validated sign assets

No current motion has completed expert ASL validation, so default approved vocabulary is empty. Four old recorded previews and six demos remain explicit opt-ins; 74 new assets are inspection-only. Conservative local context rules resolve some candidate English senses, but full grammatical ASL, general conversational understanding, directional agreement and reviewed nonmanual expression remain unavailable. Missing or ambiguous concepts are reported. Valid alphabet animations are absent, so fingerspelling is disabled. Camera input covers basic pose demonstrations, and speech is not synchronized lip sync. Physical speech/microphone quality has not been verified.

The original Python implementation and documentation below are preserved. Its gesture database contains 44 class labels, but trained `cnn_model_keras2.h5`, gesture training images, and imported `cnn_tf.py` are absent from this clone, so the original interpreter cannot run as supplied. The historical accuracy claims below belong to the original project and have not been reproduced for Sign Studio.

For approved ASL playback, complete the review of licensed motion assets and their exact retargeted Aarav rendering, including articulated hands and required nonmanual features. Record technical findings and an identified, dated human ASL approval in the registry before enabling a default entry. Review the lexical meaning separately from sentence grammar, and separately train/evaluate any replacement camera recognition model on labeled temporal data. A sequence of word mappings alone does not provide ASL grammar or continuous translation.

**3D-LEX v1.0** provides public motion data under **CC BY 4.0**. Its [primary paper](https://aclanthology.org/2024.signlang-1.33.pdf), [author repository](https://github.com/OlineRanum/SAPA), and [ASL animation component](https://osf.io/mqzyk/) establish provenance and licensing. Bounded ZIP range recovery obtained the archive directory and selected CRC-verified GLB samples; 938 files are indexed. The four research candidates contain finger/body motion. Only motion data is prepared for Aarav: third-party source geometry stays in the private inspection cache because its separate redistribution rights were not established. The archive includes empty/missing clips, differing rigs, and documented capture artifacts; successful import is not expert approval. See [SIGN_DATA_VALIDATION.md](SIGN_DATA_VALIDATION.md), [research notes](docs/research-notes.md), and the ignored `asset-downloads/asl-inspection/RETARGETING-NOTES.md` for the review and provenance record.

[Rylo Translate](https://rylo.com/sign/translate/) was inspected as a public UI/reference implementation. Its frontend, data, and dependencies have distinct licenses; neither its demonstration output nor MIT dependencies confer permission to copy its dictionary/media or approve this app's translations. A generic `Hello. Thank you.` example was submitted through the public demo interface only. No direct private API, account access, download, sharing, or private user text was used. The licensed-resource findings are recorded in [research notes](docs/research-notes.md); the local demo remains independent of Rylo's hosted services.

Avatar provenance and license notices remain in `web/assets/ATTRIBUTION.md`, `web/assets/AARAV-SOURCE.md`, and `web/assets/AARAV-LICENSE.md`. The active avatar is the existing glTF conversion of Microsoft Rocketbox Male_Adult_04. The old CC0 MPFB model is retained but no longer loaded. The implementation uses [Three.js](https://threejs.org/manual/pages/installation.html) and [MediaPipe Gesture Recognizer](https://ai.google.dev/edge/mediapipe/solutions/vision/gesture_recognizer/web_js).

---

## Original Python project — preserved documentation

> A sign language interpreter using live video feed from the camera. 
The project was completed in 24 hours as part of HackUNT-19, the University of North Texas's annual Hackathon. You can view the project demo on [YouTube](https://link.harshgupta.com/acd72). 

## Table of contents
* [General info](#general-info)
* [Screenshots](#screenshots)
* [Demo](#demo)
* [Technologies and Tools](#technologies-and-tools)
* [Setup](#setup)
* [Process](#process)
* [Code Examples](#code-examples)
* [Features](#features)
* [Status](#status)
* [Future Work](#future-work)
* [Citation](#citation)
* [Contact](#contact)

## General info

The theme at HACK UNT 19 was to use technology to improve accessibility by finding a creative solution to benefit the lives of those with a disability. 
We wanted to make it easy for 70 million deaf people across the world to be independent of translators for there daily communication needs, so we designed the app to work as a personal translator 24*7 for the deaf people.

## Demo
![Example screenshot](./img/demo4.gif)



![Example screenshot](./img/demo2.gif)



![Example screenshot](./img/demo3.gif)


![Example screenshot](./img/demo5.gif)


**The entire demo of the project can be found on [YouTube](https://link.harshgupta.com/acd72).**


## Screenshots

![Example screenshot](./img/Capture1.PNG)
![Example screenshot](./img/Capture.PNG)

## Technologies and Tools
* Python 
* TensorFlow
* Keras
* OpenCV

## Setup

* Use comand promt to setup environment by using install_packages.txt and install_packages_gpu.txt files. 
 
`pyton -m pip r install_packages.txt`

This will help you in installing all the libraries required for the project.

## Process

* Run `set_hand_histogram.py` to set the hand histogram for creating gestures. 
* Once you get a good histogram, save it in the code folder, or you can use the histogram created by us that can be found [here](https://github.com/harshbg/Sign-Language-Interpreter-using-Deep-Learning/blob/master/Code/hist).
* Added gestures and label them using OpenCV which uses webcam feed. by running `create_gestures.py` and stores them in a database. Alternately, you can use the gestures created by us [here](https://github.com/harshbg/Sign-Language-Interpreter-using-Deep-Learning/tree/master/Code).
* Add different variations to the captured gestures by flipping all the images by using `Rotate_images.py`.
* Run `load_images.py` to split all the captured gestures into training, validation and test set. 
* To view all the gestures, run `display_gestures.py` .
* Train the model using Keras by running `cnn_model_train.py`.
* Run `final.py`. This will open up the gesture recognition window which will use your webcam to interpret the trained American Sign Language gestures.  

## Code Examples

````
# Model Traiining using CNN

import numpy as np
import pickle
import cv2, os
from glob import glob
from keras import optimizers
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import Dropout
from keras.layers import Flatten
from keras.layers.convolutional import Conv2D
from keras.layers.convolutional import MaxPooling2D
from keras.utils import np_utils
from keras.callbacks import ModelCheckpoint
from keras import backend as K
K.set_image_dim_ordering('tf')

os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'

def get_image_size():
	img = cv2.imread('gestures/1/100.jpg', 0)
	return img.shape

def get_num_of_classes():
	return len(glob('gestures/*'))

image_x, image_y = get_image_size()

def cnn_model():
	num_of_classes = get_num_of_classes()
	model = Sequential()
	model.add(Conv2D(16, (2,2), input_shape=(image_x, image_y, 1), activation='relu'))
	model.add(MaxPooling2D(pool_size=(2, 2), strides=(2, 2), padding='same'))
	model.add(Conv2D(32, (3,3), activation='relu'))
	model.add(MaxPooling2D(pool_size=(3, 3), strides=(3, 3), padding='same'))
	model.add(Conv2D(64, (5,5), activation='relu'))
	model.add(MaxPooling2D(pool_size=(5, 5), strides=(5, 5), padding='same'))
	model.add(Flatten())
	model.add(Dense(128, activation='relu'))
	model.add(Dropout(0.2))
	model.add(Dense(num_of_classes, activation='softmax'))
	sgd = optimizers.SGD(lr=1e-2)
	model.compile(loss='categorical_crossentropy', optimizer=sgd, metrics=['accuracy'])
	filepath="cnn_model_keras2.h5"
	checkpoint1 = ModelCheckpoint(filepath, monitor='val_acc', verbose=1, save_best_only=True, mode='max')
	callbacks_list = [checkpoint1]
	#from keras.utils import plot_model
	#plot_model(model, to_file='model.png', show_shapes=True)
	return model, callbacks_list

def train():
	with open("train_images", "rb") as f:
		train_images = np.array(pickle.load(f))
	with open("train_labels", "rb") as f:
		train_labels = np.array(pickle.load(f), dtype=np.int32)

	with open("val_images", "rb") as f:
		val_images = np.array(pickle.load(f))
	with open("val_labels", "rb") as f:
		val_labels = np.array(pickle.load(f), dtype=np.int32)

	train_images = np.reshape(train_images, (train_images.shape[0], image_x, image_y, 1))
	val_images = np.reshape(val_images, (val_images.shape[0], image_x, image_y, 1))
	train_labels = np_utils.to_categorical(train_labels)
	val_labels = np_utils.to_categorical(val_labels)

	print(val_labels.shape)

	model, callbacks_list = cnn_model()
	model.summary()
	model.fit(train_images, train_labels, validation_data=(val_images, val_labels), epochs=15, batch_size=500, callbacks=callbacks_list)
	scores = model.evaluate(val_images, val_labels, verbose=0)
	print("CNN Error: %.2f%%" % (100-scores[1]*100))
	#model.save('cnn_model_keras2.h5')

train()
K.clear_session();

````

## Features
Our model was able to predict the 44 characters in the ASL with a prediction accuracy >95%.

Features that can be added:
* Deploy the project on cloud and create an API for using it.
* Increase the vocabulary of our model
* Incorporate feedback mechanism to make the model more robust
* Add more sign languages

## Status
Project is: _finished_. Our team was the winner of the UNT Hackaton 2019. You can find the our final submission post on [devpost](https://rebrand.ly/754c5). 

## Future Work
Link for future Github repo : https://github.com/Manishms18/Sign-Language-Advance

## Citation

````
@misc{shuklaSignLanguageInterpreter2025,
  title        = {Sign Language Interpreter Using Deep Learning},
  author       = {Shukla, Manish and Gupta, Harsh and Sharma, Ashish},
  year         = 2025,
  howpublished = {\url{https://doi.org/10.21203/rs.3.rs-7465375/v1}},
  note         = {Preprint posted on Research Square (Version 1). Licensed under CC BY 4.0},
}
````

Shukla, M., Gupta, H., & Sharma, A. (2025). Sign Language Interpreter Using Deep Learning [Preprint]. Research Square. https://doi.org/10.21203/rs.3.rs-7465375/v1

## Contact
Created by me with my teammates [Siddharth Oza](https://github.com/siddharthoza), [Ashish Sharma](https://github.com/ashish1993utd), and [Manish Shukla](https://github.com/Manishms18).

Subscribe to my [newsletter](https://upswing.substack.com/) and unlock the secrets to becoming a 10X Data Scientist! 

If you loved what you read here and feel like we can collaborate to produce some exciting stuff, or if you
just want to shoot a question, please feel free to connect with me on <a href="hello@harshgupta.com" target="_blank">email</a>, 
<a href="https://link.harshgupta.com/c9a5b" target="_blank">LinkedIn</a>, or 
<a href="https://link.harshgupta.com/34c63" target="_blank">Twitter</a>. 
My other projects can be found [here](https://link.harshgupta.com/85f2e).

[![GitHub](https://img.shields.io/github/followers/harshbg.svg?style=social)](https://link.harshgupta.com/e144a)
[![Twitter](https://img.shields.io/twitter/follow/harshbg.svg?style=social)](https://link.harshgupta.com/34c63)

