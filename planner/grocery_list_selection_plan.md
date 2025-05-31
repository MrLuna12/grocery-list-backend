# Grocery List Selection & Creation: Step-by-Step Plan

## Overview
Add the ability for users to create multiple grocery lists and switch between them in the grocery list tab. Users can select a list from a dropdown and create new lists via a modal with a name field. If the user has no lists, show a call to action to create their first list.

---

## Step-by-Step Implementation

### Step 1: Backend - List Model & API Endpoints
- [x] Add a `List` model (if not present) with `title` and `user_id` fields. (Model is `GroceryList` with `title` field)
- [x] Add API endpoints:
  - `GET /api/v1/grocery_lists` (returns all lists for the current user)
  - `POST /api/v1/grocery_lists` (creates a new list for the user)
- [x] Add a GroceryList serializer for consistent API responses.
- [x] Ensure endpoints are authenticated and scoped to the current user.

### Step 2: Frontend - Fetch & Display Lists
- [ ] Implement API calls to fetch the user's lists.
- [ ] Add frontend state for all lists and the current selection.
- [ ] Show a dropdown (or similar selector) for switching between lists.
- [ ] If no lists exist, display a friendly empty state with a "Create your first list" call to action.

### Step 3: Frontend - Create List Modal
- [ ] Add a "+" button to open a modal for new list creation.
- [ ] Modal should have a single input for the list title and a submit button.
- [ ] On successful creation, close the modal and select the new list.
- [ ] Handle errors (e.g., duplicate title, network) with toasts or inline messages.

### Step 4: Polish & Testing
- [ ] Add loading and error states for all API calls.
- [ ] Write backend request specs for API endpoints.
- [ ] Write frontend UI tests for dropdown, modal, and empty state.
- [ ] Review UX for edge cases (e.g., no lists, API failures).

---

## User Flow
- User opens grocery list tab.
- If user has no lists: sees a "Create your first list" button.
- If user has lists: sees a dropdown of their lists, with the current one selected.
- User can click "+" to open modal, enter a title, and create a new list.
- On creation, the new list is selected and shown.
- User can switch lists via the dropdown.
- Errors (e.g., duplicate title, network) are shown as toasts or inline.

---

## Key Files
- `app/models/grocery_list.rb`: GroceryList model
- `app/controllers/api/v1/grocery_lists_controller.rb`: GroceryList API endpoints
- `app/serializers/grocery_list_serializer.rb`: GroceryList serializer
- `grocery-list-frontend/app/(tabs)/grocery-list.tsx`: Dropdown, modal, and list logic
- `grocery-list-frontend/services/apiClient.ts`: API calls for lists

---

## Current Status
- Backend endpoints and model are ready and use `title` for the list name.
- Lists are user-specific and selectable via API.
- No UI for creating/selecting lists yet.

---

## Handoff for Next Agent
> **Context**: Backend for user-specific grocery lists is complete and uses `title` for the list name. Endpoints are authenticated and scoped to user.
> **Current State**: Backend is ready for frontend integration. No list selection/creation UI yet.
> **Process**: **Proceed to Step 2 (frontend work): Fetch and display lists, implement selection and creation UI.**
> **Next Priority**: Start with Step 2 (frontend fetch & display), then proceed as outlined above.
> **Gotchas**: Ensure frontend uses `title` (not `name`). Handle empty state gracefully.

**Immediate Next Steps:**
- [ ] Complete Step 2: Frontend - Fetch & Display Lists
- [ ] Wait for user approval before proceeding to Step 3

---

## Success Criteria
1. Users can create, view, and select their own lists.
2. If no lists exist, a clear call to action is shown.
3. Creating/selecting lists updates the UI and data as expected.

---

## Notes
- Keep the UI simple for now; can add sharing/collaboration later.
- Consider optimistic UI updates for list creation.
- Ensure backend endpoints are authenticated and scoped to user. 