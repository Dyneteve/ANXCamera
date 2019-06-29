package android.arch.lifecycle;

import java.util.HashMap;

public class ViewModelStore {
    private final HashMap<String, ViewModel> mMap = new HashMap<>();

    public final void clear() {
        for (ViewModel onCleared : this.mMap.values()) {
            onCleared.onCleared();
        }
        this.mMap.clear();
    }

    /* access modifiers changed from: 0000 */
    public final ViewModel get(String str) {
        return (ViewModel) this.mMap.get(str);
    }

    /* access modifiers changed from: 0000 */
    public final void put(String str, ViewModel viewModel) {
        ViewModel viewModel2 = (ViewModel) this.mMap.put(str, viewModel);
        if (viewModel2 != null) {
            viewModel2.onCleared();
        }
    }
}
