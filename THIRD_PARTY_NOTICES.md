# Third-party notices

Updated **12 October 2026**. Application code, avatar geometry, recorded motion
data, runtime software, model weights, fonts, and research references have
separate provenance and terms. The repository's own MIT license does not
relicense third-party material. Keep these notices and the accompanying
per-asset notices with any distribution that includes the corresponding assets.

## Recorded ASL motion: 3D-LEX v1.0

**Attribution:** Oline Ranum, Gomèr Otterspeer, Jari I. Andersen, Robert G.
Belleman, and Floris Roelofsen (2024), **3D-LEX v1.0**.
[Publication and citation](https://aclanthology.org/2024.signlang-1.33/).

**Data source:** [3D-LEX ASL Animation Data](https://osf.io/mqzyk/), specifically
the public [ASL_ANIM_GLB.zip archive](https://osf.io/download/tcnhs/).
The [OSF license record](https://api.osf.io/v2/licenses/563c1cf88c5e4a3877f9e96a/)
and [author repository](https://github.com/OlineRanum/SAPA) identify the dataset
as **Creative Commons Attribution 4.0 International (CC BY 4.0)**.
[License summary](https://creativecommons.org/licenses/by/4.0/),
[full license](https://creativecommons.org/licenses/by/4.0/legalcode).
The author's code license is separate from this dataset license; no SAPA
implementation code is imported by this motion extraction.

| Original archive file | Motion-only runtime asset | License |
| --- | --- | --- |
| `help.glb` | `web/assets/asl/help.motion.json` | CC BY 4.0 |
| `yes.glb` | `web/assets/asl/yes.motion.json` | CC BY 4.0 |
| `no.glb` | `web/assets/asl/no.motion.json` | CC BY 4.0 |
| `love.glb` | `web/assets/asl/love.motion.json` | CC BY 4.0 |

**Changes made:** Motion-only extraction retains the source skeleton's
transforms and parentage, inverse-bind metadata, and animation tracks in JSON
form. Source node names and parentage are retained. Source meshes, materials,
textures/images, and nonessential extras are omitted. The playback implementation
adapts the extracted motion to the existing Rocketbox Aarav rig using the first animated pose, anatomical palm/finger calibration, and recorded near-contact constraints. Defective terminal exporter-reset frames are excluded from runtime sampling; raw tracks remain. Extraction and
retargeting are modifications, not unaltered original GLBs. The per-asset JSON
metadata and [motion attribution record](web/assets/asl/ATTRIBUTION.md) retain
the exact archive filename, original GLB SHA-256, authors, license URL,
modification record, and review status. Retain those records with derived assets.

**Source mesh boundary:** Inspected source GLBs contain a Wolf3D avatar. Its
separate geometry/texture redistribution rights were not independently
established. Source GLBs and archive samples stay in the private, git-ignored
`asset-downloads/` directory, which is outside the application's static-serving
allowlist. The source Wolf3D mesh, materials, and textures are not included in
the public motion-only assets. They must not be described as cleared for reuse
merely because the dataset's motion data is CC BY 4.0. The runtime avatar is the
separately licensed Rocketbox model below.

The four recorded motions are **unreviewed research previews**. Their source
filenames and publication do not approve the retargeted motions, their English
sense mappings, or sentence-level ASL translation. No author endorsement is
implied. See [SIGN_DATA_VALIDATION.md](SIGN_DATA_VALIDATION.md) for per-sign gates,
meaning boundaries, technical checks, and the required identified human ASL
review. Full grammatical translation and validated fingerspelling remain
unavailable.

## Active avatar: Microsoft Rocketbox Aarav

`web/assets/aarav.glb` is the **Microsoft Rocketbox Male_Adult_04** avatar,
converted to binary glTF by the maintainer of
[react-ai-voice-avatar](https://github.com/927tanmay/react-ai-voice-avatar).
The original avatar is licensed under **MIT**, Copyright (c) 2020 Microsoft.
The application applies appearance tints and animation at runtime.

Preserve the complete [local avatar MIT notice](web/assets/AARAV-LICENSE.md)
and [local provenance record](web/assets/AARAV-SOURCE.md).
Upstream: [original Rocketbox license](https://github.com/microsoft/Microsoft-Rocketbox/blob/master/LICENSE.md),
[conversion provenance/license](https://github.com/927tanmay/react-ai-voice-avatar/blob/main/assets/avatars/LICENSE.md),
[converted asset](https://github.com/927tanmay/react-ai-voice-avatar/blob/main/assets/avatars/aarav.glb).
The model's license is independent of the 3D-LEX motion license and of any
third-party mesh contained in the original motion-capture archive.

## Retained legacy avatar: MPFB example

`web/assets/human.glb` is the retained `mpfb.glb` example by **met4citizen**,
created using Blender and MPFB. It is not the active runtime avatar. The upstream
author identifies this particular example as **CC0** in the
[TalkingHead example-avatar notes](https://github.com/met4citizen/TalkingHead#the-indexhtml-test-app).
[Source example](https://github.com/met4citizen/TalkingHead/tree/main/avatars),
[CC0 terms](https://creativecommons.org/publicdomain/zero/1.0/).
This finding does not assign CC0 to other TalkingHead or Ready Player Me models.
Existing provenance is retained in [web/assets/ATTRIBUTION.md](web/assets/ATTRIBUTION.md).

## Three.js 0.170.0: software

Three.js and the loaded GLTFLoader are distributed under **MIT**.
[Pinned upstream notice](https://github.com/mrdoob/three.js/blob/r170/LICENSE).
The installed copy's complete notice follows:

```text
The MIT License

Copyright © 2010-2024 three.js authors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

## MediaPipe: software and model weights

### Runtime software

The installed **@mediapipe/tasks-vision 0.10.14** npm package declares
**Apache License 2.0**. This covers the MediaPipe runtime software, subject to
its upstream terms and applicable dependency notices.
[MediaPipe license](https://github.com/google-ai-edge/mediapipe/blob/master/LICENSE),
[Apache 2.0 full text](https://www.apache.org/licenses/LICENSE-2.0),
[official Web SDK licensing clarification](https://github.com/google-ai-edge/mediapipe/issues/6306).
Redistributions must carry the applicable license and notices, including any
separate notices required by compiled dependencies.

The exact installed `0.10.14` package contains JS/WASM but no standalone LICENSE
or NOTICE file. Its full compiled-component inventory, corresponding source
revision, and component-specific notices were **not established** by this audit.
This record is not a complete artifact-level SBOM or a claim that every compiled
dependency is licensed under MediaPipe's Apache-2.0 terms.

### Gesture-recognition weights

`web/assets/gesture_recognizer.task` is a separate model-weight bundle.
Its recorded source is Google's versioned Gesture Recognizer float16/1 model,
linked from the [official task guide](https://developers.google.com/edge/mediapipe/solutions/vision/gesture_recognizer).
The local file has **8,373,440 bytes**, SHA-256:

```text
97952348cf6a6a4915c2ea1496b4b37ebabc50cbbf80571435643c455f2b0482
```

The model license is recorded as **Apache-2.0 based on an explicit model
declaration**, not inferred from the npm software license. On **5 October 2026**,
MediaPipe collaborator **schmidt-sebastian** stated that the source and models
are Apache-2.0 unless otherwise noted.
[Official maintainer statement](https://github.com/google-ai-edge/mediapipe/issues/6355).
No contrary notice was found in this model's guide, model card, or inspected
local task metadata. Applying that general publisher statement to this bundle
is an inference; artifact-specific signed licensing/provenance was not found.

The nested hand detector, hand landmark detector, gesture embedder, and canned
gesture classifier were inspected independently. Their metadata does not
contain a license field/entry and their associated-file archives contain no
license notice. Exact component hashes and findings are in
[docs/dependency-license-notes.md](docs/dependency-license-notes.md).

The [model card](https://storage.googleapis.com/mediapipe-assets/gesture_recognizer/model_card_hand_gesture_classification_with_faireness_2022.pdf)
places sign-language translation outside this pose classifier's intended scope.
Camera confidence and successful model loading do not establish ASL accuracy.

## Optional Google Fonts: font software

The stylesheet requests **DM Sans** and **Manrope** from Google Fonts, with
system-font fallbacks. No font binaries were added to the project by this work.
Font software retains its own license even when used in an MIT application.

| Font | Copyright | Terms |
| --- | --- | --- |
| DM Sans | Copyright 2014 The DM Sans Project Authors | [SIL Open Font License 1.1](https://github.com/google/fonts/blob/main/ofl/dmsans/OFL.txt) |
| Manrope | Copyright 2018 The Manrope Project Authors | [SIL Open Font License 1.1](https://github.com/google/fonts/blob/main/ofl/manrope/OFL.txt) |

If fonts are bundled or self-hosted later, retain each font's copyright and
complete OFL notice. Browser-delivered font files are external resources and
are separate from locally hosted avatar, motion, and camera-model assets.

## Rylo and related signing resources: research only

[Rylo Translate](https://rylo.com/sign/translate/) and its official source
repository were inspected as references. Rylo's free tier is **CC BY-NC-SA 4.0**,
Copyright (c) 2022 **Nagish Inc.**, with a separate commercial license for
for-profit organizations.
[Official Translate terms](https://rylo.com/sign/translate/legal/terms/),
[inspected source-license revision](https://github.com/sign/translate/blob/928d49ffe223fccedca64162851d4951b9152ecc/LICENSE.md),
[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).

No Rylo implementation code, dictionary media/data, demo translation output,
signing coordinates, or branding were imported into this application. MIT or
Apache licenses for libraries listed on Rylo's dependency page do not establish
an unrestricted license for its application, models, or sign data. Linked
SignBank+/SignWriting resources have their own code/model/data terms and were
not imported. See [docs/research-notes.md](docs/research-notes.md) for separate
source and licensing findings.

Lifeprint/ASLU pages were consulted for possible lexical meaning boundaries;
no reference videos, images, or motion tracks were copied. Their references
neither license 3D-LEX data nor validate the rendered Aarav motions.

## Browser speech services

Speech uses available browser/operating-system voices and browser speech
recognition. No TTS model weights, provider SDK, paid-service requirement, or
API key were added. The providers' service terms remain separate from project
licenses. Voices may require network access, and speech recognition may use
browser-provider services. Installed voice names and successful API events
are not proof of natural speech quality; physical listening and transcription
need device testing. None of these licenses or checks establishes expert
sign-language approval.

## Vocabulary expansion — 12 October 2026

Twenty-four **additional motion-only** 3D-LEX ASL files were installed in two
additive batches: FAMILY, WATER, REMEMBER, PLEASE, YOU, DRINK, WANT, WHERE,
WHO, WHEN, WHY, HOW, BAD, HAPPY, SAD, WORK, SCHOOL, HOME, MOTHER, SISTER,
KNOW, UNDERSTAND, GO and SORRY. Together with the four old files the library
contains 28 recordings. All retain author attribution, source GLB SHA256,
archive filename, runtime hash, modification notice and **CC BY 4.0** terms.
All new assets are inspection-only; permission to redistribute motion does
not establish linguistic approval.

Copyright/attribution: Oline Ranum, Gomèr Otterspeer, Jari I. Andersen,
Robert G. Belleman and Floris Roelofsen (2024), 3D-LEX v1.0.
[Author publication/code](https://github.com/OlineRanum/SAPA),
[ASL dataset](https://osf.io/mqzyk/),
[archive](https://osf.io/download/tcnhs/),
[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
Only skeletal transforms, original keyframes and inverse-bind data are
redistributed. Source avatar meshes/materials/textures remain private.
Aarav retargeting/calibration/terminal-reset handling is described in
SIGN_DATA_VALIDATION.md. The 938-entry discovery index is licensed archive
file metadata, not imported source geometry or approved vocabulary.

No EvilPort2 code, images, weights or histogram is distributed in this app;
artifact-specific reuse terms for that inspected repository were not established.
Its byte-identical database was recorded as duplicate provenance, not copied
over the existing data. How2Sign, ASL Citizen and ASLLVD were investigated but
their videos, annotations and models were not imported. See
[repository audit](docs/REPOSITORY_AUDIT.md) and
[import report](docs/IMPORT_REPORT.md) for resource-specific decisions.

## Everyday motion batch — 12 October 2026

A further **50 unique motion-only** files were installed, bringing the total
to 78. These are the same author-published **3D-LEX ASL component, CC BY 4.0**
described above, with the same five-author attribution and per-file source
GLB/runtime hashes, archive paths, license URL and modification notice. Exact
accepted IDs and exclusions are in the everyday import reports; the complete
asset review snapshot/worklist is separate from older historical snapshots.
No source mesh/material/texture or Lifeprint reference media was imported.

All 50 additions remain inspection-only and all 78 recorded assets remain
linguistically pending. Topic labels and authored pending phrase-review
proposals grant no animation permission or ASL approval. See
[EVERYDAY_EXPANSION.md](docs/EVERYDAY_EXPANSION.md) and the linked ASLU audits.
