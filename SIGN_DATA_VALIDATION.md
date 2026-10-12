# ASL sign data and validation register

The registry is `web/sign-registry.mjs`. The backend enforces its review status; incoming requests cannot approve assets or supply a replacement registry. Default vocabulary mode is **validated**. At present it contains **zero approved signs**. Full grammatical translation and validated fingerspelling are unavailable.

The exact review candidates, runtime/source hashes, format, candidate meanings,
license records, and avatar/retarget-code hashes are frozen in
[docs/sign-asset-manifest.json](docs/sign-asset-manifest.json). No identified
fluent signer or qualified interpreter has approved them.

## Playback modes

| Mode | Eligible assets | Meaning and accuracy |
| --- | --- | --- |
| `validated` — default | Only entries with `validated: true`, a passed technical review, and an identified/date-stamped human ASL approval | All current assets are excluded; input and missing coverage remain visible |
| `research` — explicit opt-in | Four sourced, unreviewed 3D-LEX motion previews | Exact English source glosses only; conditional meaning choices; neither source nor retargeting is claimed accurate |
| `demo` — explicit opt-in | Six retained procedural demonstrations | Existing multilingual display/input examples for testing controls; not ASL translation or an approved sign vocabulary |

Camera pose demonstrations obey the same gate and require explicit Demo mode. Camera confidence measures pose detection, not ASL correctness. Unsupported terms never trigger a generic talk animation or invented fingerspelling.

## Recorded research entries

These are candidate lexical meanings, informed by the primary reference pages below. Reading a reference is not approval of the motion. All four entries have `validated: false`, `humanReview: null`, and `technicalReview.status: "pending"`. Their motion-only runtime paths must be checked after extraction and retargeting; a path in the registry alone is not a file-load success.

| ID / source filename | English mapping | Meaning boundary | Primary meaning reference | Runtime motion path | Review |
| --- | --- | --- | --- | --- | --- |
| `3dlex-help` / `help.glb` | `help` | Assistance/help as a lexical item. Do not infer who helps whom, directional agreement, tense, or a question | [ASLU HELP](https://www.lifeprint.com/asl101/pages-signs/h/help.htm) | `/web/assets/asl/help.motion.json` | Technical pending; human approval absent |
| `3dlex-yes` / `yes.glb` | `yes` | Lexical affirmative answer. Contextual emphasis and nonmanual realization remain unreviewed | [ASLU YES](https://www.lifeprint.com/asl101/pages-signs/y/yes.htm) | `/web/assets/asl/yes.motion.json` | Technical pending; human approval absent |
| `3dlex-no` / `no.glb` | `no`, only after `senses.no: "negative-answer"` | Negative answer/refusal. Do not automatically substitute for NONE, NOTHING, NOT, or directional reported refusal | [ASLU NO](https://www.lifeprint.com/asl101/pages-signs/n/no.htm) | `/web/assets/asl/no.motion.json` | Technical pending; human approval absent |
| `3dlex-love` / `love.glb` | `love`, only after `senses.love: "affection"` | Affection/love as one lexical concept. This is not the complete phrase “I love you,” the ILY acronym handshape, LOVE-IT, or HUG | [ASLU LOVE](https://www.lifeprint.com/asl101/pages-signs/l/love.htm) | `/web/assets/asl/love.motion.json` | Technical pending; human approval absent |

The YES reference describes a fist/wrist movement. NO includes motion, direction, and nonmanual variations. HELP is directional and has handshape variants. LOVE and ILY are distinguished by the reference. These distinctions define what must be reviewed; they were not used to invent replacement animation tracks. Lifeprint media is not copied into the app and does not license the 3D-LEX motion data.

Research mode reports unselected or unknown `no`/`love` senses through `ambiguousTerms`; it does not animate them automatically. A meaning selection is a user choice, not expert approval, and does not enable an asset in validated mode. Research `I love you` with affection selected can preview only the source `love` word; `I` and `you` remain unsupported. The existing complete-phrase demo stays isolated in Demo mode.

## Source provenance and license

3D-LEX v1.0: Oline Ranum, Gomèr Otterspeer, Jari I. Andersen, Robert G. Belleman, and Floris Roelofsen (2024). [Paper and citation](https://aclanthology.org/2024.signlang-1.33/). Dataset: [ASL Animation Data](https://osf.io/mqzyk/); [GLB archive](https://osf.io/download/tcnhs/). The source [OSF license record](https://api.osf.io/v2/licenses/563c1cf88c5e4a3877f9e96a/) and [author repository](https://github.com/OlineRanum/SAPA) identify **CC BY 4.0**. Preserve authors, source and [license](https://creativecommons.org/licenses/by/4.0/) attribution, and describe extraction/retargeting modifications with each installed motion.

The public archive exists; an earlier access-gap assumption was corrected. Its inspected directory contains 938 GLBs. The source [known-issues wiki](https://api.osf.io/v2/wikis/fq59z/content/) reports 62 missing GLB animations. Private sample inspection found no animation in `hello.glb`, and `thank_you.glb` was absent. No recorded greetings or thanks are fabricated to fill those gaps. Source meshes are kept private because their separate redistribution rights were not established; Aarav's existing MIT-licensed Rocketbox model remains the runtime avatar.

Archive filenames are the available gloss labels, not independently reviewed English sense mappings. The paper records source capture review but also discusses handshape and orientation artifacts and limitations in facial/nonmanual assessment. Neither that paper nor a successful technical file parse approves the retargeted Aarav animation.

## Required review before default eligibility

For each exact installed asset, record:

1. Original filename, source archive, source gloss/meaning, license, attribution, and a content hash.
2. Target rig and all transformations: coordinates, bind pose, bone mapping, timing, trimming, interpolation, and finger/palm calibration.
3. Technical checks for loading, finite/unit rotation data, handshape, wrist orientation, elbow/shoulder deformation, contact, signing location, face visibility, transitions, and desktop/mobile framing throughout the clip.
4. Human ASL review of the rendered target animation, its intended sense and mapping, movement/orientation/location, regional variation, and required facial/nonmanual features. Identify the reviewer, date, exact reviewed asset, findings, and approval decision.
5. A separate sentence/grammar plan before presenting concatenated lexical clips as full ASL translation. Fingerspelling requires its own reviewed alphabet and transition assets.

Set `validated: true` only after the exact target asset and mapping pass the relevant technical and human checks. Reference pages, source filenames, user meaning selections, pose-recognizer confidence, and generated motion are insufficient substitutes for that review.

## Technical results and visual inspection — 12 October 2026

Four motion-only JSON files were actually extracted and installed. No source
mesh, texture, material, image, or source GLB is served by the website. Their
original tracks and original GLB hashes remain in the assets.

Initial browser inspection caught a whole-body tilt in YES that finite-transform
tests missed. Source static node axes differ from the first animated pose, and
the exports contain abrupt terminal actor-axis resets. Calibration now uses the
actual first animated anatomical pose. Playback holds the last usable pose
instead of sampling those defective terminal frames; original raw keys remain
available for inspection. Mid-clip resets, invalid frames, missing finger tracks,
or excessive distortion fail preparation rather than receive a demo substitute.

| Motion | Last usable source time | Maximum target body tilt | Maximum wrist-goal difference | Current review |
| --- | --- | --- | --- | --- |
| HELP | 3.208333 s | 4.35° | 3.96 cm | Automated checks pass; visual contact/meaning and human review pending |
| YES | 3.000000 s | 3.46° | 3.36 cm | Automated checks pass; wrist motion/handshape/nonmanual review pending |
| NO | 5.291667 s | 4.46° | 4.72 cm | Automated checks pass; exact sense/variant and nonmanual review pending |
| LOVE | 8.458333 s | 5.12° | 4.57 cm | Automated checks pass; chest location/handshape and human review pending |

These measurements describe this retargeter, not sign accuracy. Source and
target finger-segment directions and palm frames remain within 0.000002 radians
under anatomical calibration in the sampled tests. Near-contact wrist IK
preserves a selected source landmark-pair vector: HELP's closest pair remains
2.413 cm apart; NO's remains 4.881 cm apart. This is a skeletal proxy, not a
skin-contact guarantee; other near-contact landmarks can differ. LOVE's closest
mean wrist-to-Spine2 proxy differs by about 3.10 cm. Target hand size, torso
proportions, fine handshape, orientation, contact, and signing location still
require review.

The browser was inspected during paused/playback frames for all four recordings
at a measured 360 CSS-pixel mobile width. YES remained upright with a raised
fist, HELP showed both hands together, and LOVE showed crossed arms at the
chest. NO included a two-hand pose near the face during the inspected interval;
its exact source variant and negative-answer mapping need priority ASL review.
These descriptions are direct visual observations, not expert identification
or approval. No facial capture is supplied by these motion assets; neutral
blinking does not supply grammatical nonmanual features.

Automated avatar checks sample the real skinned face/hands throughout each
retargeted clip at desktop/mobile sizes, and test upright/frontal posture,
framing, transitions, repeated queues, pause/resume/stop, disposal, and missing
motion failures. Browser checks also cover a 500-word recorded queue, ambiguous
meaning choices, preserved punctuation/text, unsupported vocabulary, and legacy
history revalidation. See [docs/VERIFICATION.md](docs/VERIFICATION.md).

## Human review worklist

Review the exact assets and renderer hashes in the manifest, comparing both
source motion and the rendered Aarav output with the same-language references.
For each candidate, record reviewer identity/qualification, date, regional
variant, intended sense, observed defects, and an approval or rejection:

- HELP: loose-thumb-A/S variation, palm support/contact, lift, signing location,
  and directional agreement; do not infer who helps whom from an isolated clip.
- YES: S hand, palm/wrist orientation and nodding movement, emphasis, and
  handshape capture artifacts.
- NO: verify the source gloss and exact negative-answer variant first; compare
  handshape, movement count, palm direction, location, two-hand involvement and
  required headshake. Do not equate it with NONE/NOTHING/NOT.
- LOVE: crossed-hand chest placement and handshape, affection sense versus ILY,
  HUG and LOVE-IT; it does not represent the complete sentence “I love you.”

Sentence grammar, semantic facial/body expressions, and reviewed fingerspelling
are separate missing capabilities. Passing the technical checks above does not
close any of these linguistic review items or enable the default vocabulary.

## Demo assets retained for control testing

`hello`, `thanks`, `yes`, `no`, `help`, and `love` are the prior procedural animations. They are retained to preserve existing control/playback testing, with unvalidated status displayed and explicit Demo opt-in required. Their old translated phrase labels do not establish ASL meanings. No procedural motion is promoted automatically when a similarly named recorded source appears.

## Expanded canonical library — 12 October 2026

**Latest state:** 122 candidate concepts, 141 aliases, 122 inflections and
78 recordings after the additional everyday batch. All remain pending
linguistic review; 74 are inspection-only and four are retained explicit
unverified Research previews. Zero approved signs/templates are enabled.
The counts and 28-asset snapshot below describe the earlier expansion.
See [EVERYDAY_EXPANSION.md](docs/EVERYDAY_EXPANSION.md) for the new 50-asset
batch, source checks, sense distinctions, exclusions and review requirements.
The latest renderer/source hashes and 30 Hz diagnostics are in
`docs/vocabulary-final-everyday-review-20261012.json`, with all 78 pending review
rows in `docs/ASL_FINAL_EVERYDAY_REVIEW_WORKLIST.md`. Manual queue selection and
timeline seeking do not change these review decisions or trim original tracks.

The runtime source of truth is now `web/vocabulary-manifest.json`: 48 candidate
concepts, 66 aliases, 49 inflections, 28 recordings and zero approved signs.
The earlier four-clip results above remain historical evidence. Current
source/runtime/renderer hashes and 30 Hz retarget diagnostics for every clip
are recorded in [the expanded snapshot](docs/vocabulary-review-20261012.json).
[ASL_REVIEW_WORKLIST.md](docs/ASL_REVIEW_WORKLIST.md) lists each asset's
concept, sense, same-language reference and pending review. The source license
and ASL component were checked separately from any avatar license.

Both new batches were dry-run before commit, deduplicated by raw file hash,
source provenance, ASL/concept/sense, variant and normalized animation content,
then imported without replacing existing motion bytes. Repeat commits added
nothing. Static or conflicting labels stayed out. All 24 additions have
`inspectionOnly: true`, `translationEligible: false`, identified sources and
`linguisticReview.status: pending`. A manually selected `asset-review` request
can inspect a registered clip; no client path/approval or text match can enable
it. Default validated output stays empty. The four old explicit Research
previews are preserved under their existing unverified status.

Automated checks cover finite motion, three finger segments, rest/animated
axis calibration, palm/finger direction, reach/contact proxies, upright/frontal
posture, exact skinned face/hands and camera framing throughout all 28 clips
on desktop/mobile. These checks passed. They do not establish handshape
semantics, surface contact, regional variants or required nonmanuals. Facial
capture is absent from these assets. Published reference descriptions only
establish comparison criteria; no ASLU image/video was copied.

Direct browser observations of the first five additions: FAMILY's two hands
move in front of the torso; WATER raises the dominant hand near the face;
REMEMBER includes a long initial idle interval followed by two-hand contact;
PLEASE places one hand over the chest; YOU extends the dominant hand forward.
Face and both hands remain inside the mobile viewer in the inspected poses.
DRINK was additionally inspected on desktop with a curled hand near the face.
These are observations, not expert sign identification. Exact F/W/C handshape,
thumb/finger contact, mouth/forehead/chest placement and YOU direction require
human review. Browser sampling did not linguistically validate any of the 28.

Candidate meanings for bank (finance/river edge), light (illumination/weight),
right (direction/correctness), and like (enjoyment/resemblance) remain distinct.
English synonym candidates are not automatically approved ASL equivalences.
The pending request-help template has no approved full-sentence animation.
Negated clauses are held before lexical playback; a complete `I love you`
concept cannot become the affection clip. Tense, names, numbers and original
text remain visible. A semantic match or user clarification cannot approve
an animation, supply grammar or create fingerspelling.

The 938 source-discovery records have no canonical sense, playable path or
translation eligibility. They support locating future batches. Their filenames
and ZIP CRC/size do not replace SHA256, source evidence or review. All 938 files
were indexed, not downloaded/validated as 938 signs. For exclusions, counts,
licensing and actual reuse from both recognition repositories, see
[IMPORT_REPORT.md](docs/IMPORT_REPORT.md) and
[REPOSITORY_AUDIT.md](docs/REPOSITORY_AUDIT.md).
