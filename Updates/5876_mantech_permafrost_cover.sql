-- Both Garfrost difficulties use Saronite Rock to break Permafrost LOS.
-- Normal 68786 has ALWAYS_LINE_OF_SIGHT, which overrides IGNORE_LINE_OF_SIGHT.
-- Heroic 70336 was missing that override, bypassing the native rock collision.
-- Retain every other attribute, including custom bits; safe to reapply.
UPDATE spell_template
SET AttributesEx5 = AttributesEx5 | 33554432
WHERE Id = 70336 AND (AttributesEx5 & 33554432) = 0;
