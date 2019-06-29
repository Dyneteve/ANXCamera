package miui.maml.animation.interpolater;

import android.text.TextUtils;
import android.view.animation.Interpolator;
import miui.maml.data.Expression;
import miui.maml.data.IndexedVariable;
import miui.maml.data.Variables;
import org.w3c.dom.Element;

public class InterpolatorHelper {
    private static final String VAR_RATIO = "__ratio";
    private Expression mEaseExp;
    private Interpolator mInterpolator;
    private IndexedVariable mRatioVar;

    public InterpolatorHelper(Variables variables, String str, String str2) {
        this.mInterpolator = InterpolatorFactory.create(str);
        this.mEaseExp = Expression.build(variables, str2);
        if (this.mEaseExp != null) {
            this.mRatioVar = new IndexedVariable(VAR_RATIO, variables, true);
        }
    }

    public static InterpolatorHelper create(Variables variables, String str, String str2) {
        if (!TextUtils.isEmpty(str) || !TextUtils.isEmpty(str2)) {
            return new InterpolatorHelper(variables, str, str2);
        }
        return null;
    }

    public static InterpolatorHelper create(Variables variables, Element element) {
        return create(variables, element.getAttribute("easeType"), element.getAttribute("easeExp"));
    }

    public float get(float f) {
        if (this.mEaseExp == null) {
            return this.mInterpolator != null ? this.mInterpolator.getInterpolation(f) : f;
        }
        this.mRatioVar.set((double) f);
        return (float) this.mEaseExp.evaluate();
    }

    public boolean isValid() {
        return (this.mEaseExp == null && this.mInterpolator == null) ? false : true;
    }
}
