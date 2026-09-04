# Victory Floor Plan

Drag-and-drop booth assignment board for the Victory Foodservice trade show.

- **72 booths** — four vertical bands, six rows in the upper half and six in the
  lower half, traced from the printed 2024 hall layout.
- **Vendor roster** in the left rail. Drag a vendor onto a booth; drop one back
  on the list to unassign. On a tablet, tap the vendor then tap the booth.
- **Two vendors per booth.** Dropping a second vendor on an occupied booth
  splits it in half, matching how shared booths were handled last year.
- **Shared and live.** Assignments are stored server-side, so everyone working
  the plan sees each other's changes as they happen.

## Files

| File | What it is |
| --- | --- |
| `floor-plan.html` | The whole application — one self-contained page. |

## Editing the layout

Booth geometry lives in the `FLOOR PLAN GEOMETRY` block near the top of the
script. Booths are laid out as a `COLUMNS` array: each entry is one vertical
band with its `x` offset and the booth numbers running top to bottom in the
upper and lower halves. Fixed features — stage, produce, truck, reception,
passport table, pipe and drape — are separate and are not assignable.

The vendor roster is the `VENDOR_NAMES` array directly below it.

## Persistence

The published page uses the Claude Artifacts `db` capability. Each vendor's
assignment is one document at `assignments/<vendor-slug>`, so two people
assigning different vendors at the same time never overwrite each other.
Opened as a plain local file, the page runs in memory and says so.
