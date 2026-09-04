# Victory Floor Plan

Drag-and-drop booth assignment board for the Victory Foodservice trade show.

**Live:** https://starlyns.github.io/vendorsdrag/

- **72 booths** — four vertical bands, six rows in the upper half and six in
  the lower half, traced from the printed 2024 hall layout.
- **Vendor roster** in the left rail. Drag a vendor onto a booth; drop one back
  on the list to unassign. On a tablet, tap the vendor then tap the booth.
- **Two vendors per booth.** Dropping a second vendor on an occupied booth
  splits it in half, matching how shared booths were handled last year.
- **Shared and live.** Everyone with the link works the same plan and sees each
  other's changes within a second or two.

## Files

| File | What it is |
| --- | --- |
| `index.html` | The whole application — one self-contained page. |
| `supabase-setup.sql` | One-time database setup. Run once, in the Supabase SQL editor. |

## The shared database

Connected. Assignments live in a Supabase project, in a single `assignments`
table — one row per placed vendor, so two people assigning different vendors at
the same moment never overwrite each other.

To point the board at a different project: run `supabase-setup.sql` there once,
then replace the `SUPABASE` block near the top of the script in `index.html`
with that project's **Project URL** and **publishable** key from
Settings → API. Leave those blank and the page falls back to browser-only
storage and says so in a banner rather than losing work silently.

Both stored values are meant to be public — they ship inside the page. What the
publishable key can do is fixed by the row-level-security policy in
`supabase-setup.sql`: read and write booth assignments, nothing else. The
`service_role` / secret key must never appear in this repo.

**Who can edit:** anyone who has the page link. There is no sign-in. That is
deliberate for a committee working a floor plan together, but it means the link
is the only gate — share it the way you would a writable spreadsheet link.

## Editing the layout

Booth geometry lives in the `FLOOR PLAN GEOMETRY` block near the top of the
script. Booths are laid out as a `COLUMNS` array: each entry is one vertical
band with its `x` offset and the booth numbers running top to bottom in the
upper and lower halves. Fixed features — stage, produce, truck, reception,
passport table, pipe and drape — are separate and are not assignable.

The vendor roster is the `VENDOR_NAMES` array directly below it.
