# Victory Floor Plan

Drag-and-drop booth assignment board for the Victory Foodservice trade show.

**Live:** https://starlyns.github.io/vendorsdrag/

- **72 booths** — four vertical bands, six rows in the upper half and six in
  the lower half, traced from the printed 2024 hall layout.
- **Vendor roster** in the left rail. Drag a vendor onto a booth; drop one back
  on the list to unassign. On a tablet, tap the vendor then tap the booth.
- **Two vendors per booth.** Dropping a second vendor on an occupied booth
  splits it in half, matching how shared booths were handled last year.
- **Shared and live** once the database is connected — everyone with the link
  works the same plan and sees each other's changes as they happen.

## Files

| File | What it is |
| --- | --- |
| `index.html` | The whole application — one self-contained page. |
| `supabase-setup.sql` | One-time database setup. Run once, in the Supabase SQL editor. |

## Connecting the shared database

Until this is done the page works, but each visitor saves to their own browser
and a red banner says so.

1. Create a free project at [supabase.com](https://supabase.com).
2. Open **SQL Editor**, paste in `supabase-setup.sql`, and press **Run**.
3. Open **Project Settings → API** and copy the **Project URL** and the
   **anon / publishable** key.
4. Put both into the `SUPABASE` block near the top of the script in
   `index.html`, and push.

Both of those values are meant to be public — they ship inside the page. What
the anon key can actually do is fixed by the row-level-security policy in
`supabase-setup.sql`, which grants exactly one thing: read and write booth
assignments. Never put the `service_role` key in this file.

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
