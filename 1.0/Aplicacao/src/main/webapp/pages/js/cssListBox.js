var lastClickedColor = '#9DB7E1';

var lastRow;

function updateRows(rowEl) {
	if (lastRow) lastRow.style.backgroundColor = '';
	rowEl.style.backgroundColor = lastClickedColor;
	lastRow = rowEl;
}

function rowClick(rowEl) {
	updateRows(rowEl);
	doRowClick(rowEl.getAttribute('rowID'));
}

// Customize this
function sample_doRowClick(rowID) {
	alert('rowID: ' + rowID);
}
