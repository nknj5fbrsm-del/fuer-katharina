\version "2.24.0"

\header {
  title = "Für Katharina"
  subtitle = "Melodie für Trompete in B · notiert in C (klingt B-Dur)"
  composer = "Opa Nils"
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
}

global = {
  \key c \major
  \time 4/4
  \tempo "Medium Swing" 4 = 92
}

melody = \relative c' {
  \global
  \transposition bes

  % A (T. 1–4)
  \mark \markup { \box A }
  e4 g8( a) g4 e |
  a4 g8 e c4 e |
  d4 f8 a g4 f |
  d2 r2 |

  % A' (T. 5–8)
  e4 g8( a) g4 e |
  a4 g8 e c'4 a |
  f4 a b g |
  c2-> g4 e |

  % B (T. 9–12)
  \mark \markup { \box B }
  f4 a8 c~ c a f4 |
  g4 e8 g b4 g |
  a4 f8 a c4 a |
  c2 b4 g |

  % A'' (T. 13–16)
  \mark \markup { \box A }
  e4 g8( a) g4 e |
  a4 g8 e c4 e |
  d4 f8 a g4 f |
  d2 f4 g |

  % Tag (T. 17–20)
  \mark \markup { \box Tag }
  e4 g8( a) c4-> a |
  g4 e8 g a2 |
  f4 a g d |
  c1 \bar "|."
}

harmonies = \chordmode {
  % A
  c1:maj7 | a1:m7 | d1:m7 | g1:7 |
  % A'
  c1:maj7 | a1:m7 | d2:m7 g2:7 | c1:maj7 |
  % B
  f1:maj7 | e1:m7 | d1:m7 | g2:7sus4 g2:7 |
  % A''
  c1:maj7 | a1:m7 | d1:m7 | g1:7 |
  % Tag
  c1:maj7 | a1:m7 | d2:m7 g2:7 | c1:maj7 |
}

% Notenbild: Melodie + Akkordsymbole (notiert in C)
\score {
  <<
    \new ChordNames { \harmonies }
    \new Staff \with {
      instrumentName = "Trompete in B"
      shortInstrumentName = "Tpt."
    } { \melody }
  >>
  \layout { }
}

% MIDI: nur Melodie, klingend in B-Dur (\transposition bes) — Schnittstelle für Suno
\score {
  \new Staff \with {
    midiInstrument = "trumpet"
  } { \melody }
  \midi { }
}
