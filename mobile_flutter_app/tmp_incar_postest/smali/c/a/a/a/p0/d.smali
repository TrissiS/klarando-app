.class public Lc/a/a/a/p0/d;
.super Lc/a/a/a/p0/e;
.source "DropdownMenuEndIconDelegate.java"


# static fields
.field public static final q:Z


# instance fields
.field public final d:Landroid/text/TextWatcher;

.field public final e:Landroid/view/View$OnFocusChangeListener;

.field public final f:Lcom/google/android/material/textfield/TextInputLayout$e;

.field public final g:Lcom/google/android/material/textfield/TextInputLayout$f;

.field public final h:Lcom/google/android/material/textfield/TextInputLayout$g;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation
.end field

.field public i:Z

.field public j:Z

.field public k:J

.field public l:Landroid/graphics/drawable/StateListDrawable;

.field public m:Lc/a/a/a/l0/h;

.field public n:Landroid/view/accessibility/AccessibilityManager;

.field public o:Landroid/animation/ValueAnimator;

.field public p:Landroid/animation/ValueAnimator;


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    sput-boolean v0, Lc/a/a/a/p0/d;->q:Z

    return-void
.end method

.method public constructor <init>(Lcom/google/android/material/textfield/TextInputLayout;)V
    .registers 4

    .line 1
    invoke-direct {p0, p1}, Lc/a/a/a/p0/e;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    .line 2
    new-instance p1, Lc/a/a/a/p0/d$a;

    invoke-direct {p1, p0}, Lc/a/a/a/p0/d$a;-><init>(Lc/a/a/a/p0/d;)V

    iput-object p1, p0, Lc/a/a/a/p0/d;->d:Landroid/text/TextWatcher;

    .line 3
    new-instance p1, Lc/a/a/a/p0/d$c;

    invoke-direct {p1, p0}, Lc/a/a/a/p0/d$c;-><init>(Lc/a/a/a/p0/d;)V

    iput-object p1, p0, Lc/a/a/a/p0/d;->e:Landroid/view/View$OnFocusChangeListener;

    .line 4
    new-instance p1, Lc/a/a/a/p0/d$d;

    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-direct {p1, p0, v0}, Lc/a/a/a/p0/d$d;-><init>(Lc/a/a/a/p0/d;Lcom/google/android/material/textfield/TextInputLayout;)V

    iput-object p1, p0, Lc/a/a/a/p0/d;->f:Lcom/google/android/material/textfield/TextInputLayout$e;

    .line 5
    new-instance p1, Lc/a/a/a/p0/d$e;

    invoke-direct {p1, p0}, Lc/a/a/a/p0/d$e;-><init>(Lc/a/a/a/p0/d;)V

    iput-object p1, p0, Lc/a/a/a/p0/d;->g:Lcom/google/android/material/textfield/TextInputLayout$f;

    .line 6
    new-instance p1, Lc/a/a/a/p0/d$f;

    invoke-direct {p1, p0}, Lc/a/a/a/p0/d$f;-><init>(Lc/a/a/a/p0/d;)V

    iput-object p1, p0, Lc/a/a/a/p0/d;->h:Lcom/google/android/material/textfield/TextInputLayout$g;

    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lc/a/a/a/p0/d;->i:Z

    .line 8
    iput-boolean p1, p0, Lc/a/a/a/p0/d;->j:Z

    const-wide v0, 0x7fffffffffffffffL

    .line 9
    iput-wide v0, p0, Lc/a/a/a/p0/d;->k:J

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/p0/d;J)J
    .registers 3

    .line 3
    iput-wide p1, p0, Lc/a/a/a/p0/d;->k:J

    return-wide p1
.end method

.method public static synthetic a(Lc/a/a/a/p0/d;)Landroid/view/accessibility/AccessibilityManager;
    .registers 1

    .line 2
    iget-object p0, p0, Lc/a/a/a/p0/d;->n:Landroid/view/accessibility/AccessibilityManager;

    return-object p0
.end method

.method public static synthetic a(Landroid/widget/EditText;)Landroid/widget/AutoCompleteTextView;
    .registers 1

    .line 1
    invoke-static {p0}, Lc/a/a/a/p0/d;->c(Landroid/widget/EditText;)Landroid/widget/AutoCompleteTextView;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lc/a/a/a/p0/d;Landroid/widget/AutoCompleteTextView;)V
    .registers 2

    .line 5
    invoke-virtual {p0, p1}, Lc/a/a/a/p0/d;->d(Landroid/widget/AutoCompleteTextView;)V

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/p0/d;Z)V
    .registers 2

    .line 4
    invoke-virtual {p0, p1}, Lc/a/a/a/p0/d;->b(Z)V

    return-void
.end method

.method public static synthetic b(Lc/a/a/a/p0/d;)Lcom/google/android/material/textfield/TextInputLayout$e;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/p0/d;->f:Lcom/google/android/material/textfield/TextInputLayout$e;

    return-object p0
.end method

.method public static synthetic b(Lc/a/a/a/p0/d;Landroid/widget/AutoCompleteTextView;)V
    .registers 2

    .line 4
    invoke-virtual {p0, p1}, Lc/a/a/a/p0/d;->b(Landroid/widget/AutoCompleteTextView;)V

    return-void
.end method

.method public static synthetic b(Landroid/widget/EditText;)Z
    .registers 1

    .line 2
    invoke-static {p0}, Lc/a/a/a/p0/d;->d(Landroid/widget/EditText;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lc/a/a/a/p0/d;Z)Z
    .registers 2

    .line 3
    iput-boolean p1, p0, Lc/a/a/a/p0/d;->i:Z

    return p1
.end method

.method public static synthetic c(Lc/a/a/a/p0/d;)Landroid/view/View$OnFocusChangeListener;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/p0/d;->e:Landroid/view/View$OnFocusChangeListener;

    return-object p0
.end method

.method public static c(Landroid/widget/EditText;)Landroid/widget/AutoCompleteTextView;
    .registers 2

    .line 7
    instance-of v0, p0, Landroid/widget/AutoCompleteTextView;

    if-eqz v0, :cond_7

    .line 8
    check-cast p0, Landroid/widget/AutoCompleteTextView;

    return-object p0

    .line 9
    :cond_7
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "EditText needs to be an AutoCompleteTextView if an Exposed Dropdown Menu is being used."

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic c(Lc/a/a/a/p0/d;Landroid/widget/AutoCompleteTextView;)V
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Lc/a/a/a/p0/d;->a(Landroid/widget/AutoCompleteTextView;)V

    return-void
.end method

.method public static synthetic d(Lc/a/a/a/p0/d;Landroid/widget/AutoCompleteTextView;)V
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Lc/a/a/a/p0/d;->c(Landroid/widget/AutoCompleteTextView;)V

    return-void
.end method

.method public static d(Landroid/widget/EditText;)Z
    .registers 1

    .line 16
    invoke-virtual {p0}, Landroid/widget/EditText;->getKeyListener()Landroid/text/method/KeyListener;

    move-result-object p0

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    goto :goto_9

    :cond_8
    const/4 p0, 0x0

    :goto_9
    return p0
.end method

.method public static synthetic d(Lc/a/a/a/p0/d;)Z
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/p0/d;->d()Z

    move-result p0

    return p0
.end method

.method public static synthetic e()Z
    .registers 1

    .line 1
    sget-boolean v0, Lc/a/a/a/p0/d;->q:Z

    return v0
.end method

.method public static synthetic e(Lc/a/a/a/p0/d;)Z
    .registers 1

    .line 2
    iget-boolean p0, p0, Lc/a/a/a/p0/d;->j:Z

    return p0
.end method

.method public static synthetic f(Lc/a/a/a/p0/d;)Landroid/animation/ValueAnimator;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/p0/d;->p:Landroid/animation/ValueAnimator;

    return-object p0
.end method

.method public static synthetic g(Lc/a/a/a/p0/d;)Landroid/text/TextWatcher;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/p0/d;->d:Landroid/text/TextWatcher;

    return-object p0
.end method


# virtual methods
.method public final varargs a(I[F)Landroid/animation/ValueAnimator;
    .registers 5

    .line 64
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    .line 65
    sget-object v0, Lc/a/a/a/m/a;->a:Landroid/animation/TimeInterpolator;

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    int-to-long v0, p1

    .line 66
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 67
    new-instance p1, Lc/a/a/a/p0/d$b;

    invoke-direct {p1, p0}, Lc/a/a/a/p0/d$b;-><init>(Lc/a/a/a/p0/d;)V

    invoke-virtual {p2, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-object p2
.end method

.method public final a(FFFI)Lc/a/a/a/l0/h;
    .registers 6

    .line 54
    invoke-static {}, Lc/a/a/a/l0/m;->n()Lc/a/a/a/l0/m$b;

    move-result-object v0

    .line 55
    invoke-virtual {v0, p1}, Lc/a/a/a/l0/m$b;->d(F)Lc/a/a/a/l0/m$b;

    .line 56
    invoke-virtual {v0, p1}, Lc/a/a/a/l0/m$b;->e(F)Lc/a/a/a/l0/m$b;

    .line 57
    invoke-virtual {v0, p2}, Lc/a/a/a/l0/m$b;->b(F)Lc/a/a/a/l0/m$b;

    .line 58
    invoke-virtual {v0, p2}, Lc/a/a/a/l0/m$b;->c(F)Lc/a/a/a/l0/m$b;

    .line 59
    invoke-virtual {v0}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object p1

    .line 60
    iget-object p2, p0, Lc/a/a/a/p0/e;->b:Landroid/content/Context;

    .line 61
    invoke-static {p2, p3}, Lc/a/a/a/l0/h;->a(Landroid/content/Context;F)Lc/a/a/a/l0/h;

    move-result-object p2

    .line 62
    invoke-virtual {p2, p1}, Lc/a/a/a/l0/h;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    const/4 p1, 0x0

    .line 63
    invoke-virtual {p2, p1, p4, p1, p4}, Lc/a/a/a/l0/h;->a(IIII)V

    return-object p2
.end method

.method public a()V
    .registers 7

    .line 6
    iget-object v0, p0, Lc/a/a/a/p0/e;->b:Landroid/content/Context;

    .line 7
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lc/a/a/a/d;->mtrl_shape_corner_size_small_component:I

    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    int-to-float v0, v0

    .line 9
    iget-object v1, p0, Lc/a/a/a/p0/e;->b:Landroid/content/Context;

    .line 10
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lc/a/a/a/d;->mtrl_exposed_dropdown_menu_popup_elevation:I

    .line 11
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    int-to-float v1, v1

    .line 12
    iget-object v2, p0, Lc/a/a/a/p0/e;->b:Landroid/content/Context;

    .line 13
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lc/a/a/a/d;->mtrl_exposed_dropdown_menu_popup_vertical_padding:I

    .line 14
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    .line 15
    invoke-virtual {p0, v0, v0, v1, v2}, Lc/a/a/a/p0/d;->a(FFFI)Lc/a/a/a/l0/h;

    move-result-object v3

    const/4 v4, 0x0

    .line 16
    invoke-virtual {p0, v4, v0, v1, v2}, Lc/a/a/a/p0/d;->a(FFFI)Lc/a/a/a/l0/h;

    move-result-object v0

    .line 17
    iput-object v3, p0, Lc/a/a/a/p0/d;->m:Lc/a/a/a/l0/h;

    .line 18
    new-instance v1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    iput-object v1, p0, Lc/a/a/a/p0/d;->l:Landroid/graphics/drawable/StateListDrawable;

    const/4 v2, 0x1

    new-array v2, v2, [I

    const v4, 0x10100aa

    const/4 v5, 0x0

    aput v4, v2, v5

    .line 19
    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 20
    iget-object v1, p0, Lc/a/a/a/p0/d;->l:Landroid/graphics/drawable/StateListDrawable;

    new-array v2, v5, [I

    invoke-virtual {v1, v2, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 21
    sget-boolean v0, Lc/a/a/a/p0/d;->q:Z

    if-eqz v0, :cond_52

    sget v0, Lc/a/a/a/e;->mtrl_dropdown_arrow:I

    goto :goto_54

    :cond_52
    sget v0, Lc/a/a/a/e;->mtrl_ic_arrow_drop_down:I

    .line 22
    :goto_54
    iget-object v1, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, p0, Lc/a/a/a/p0/e;->b:Landroid/content/Context;

    invoke-static {v2, v0}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 23
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    .line 24
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lc/a/a/a/j;->exposed_dropdown_menu_content_description:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconContentDescription(Ljava/lang/CharSequence;)V

    .line 26
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v1, Lc/a/a/a/p0/d$g;

    invoke-direct {v1, p0}, Lc/a/a/a/p0/d$g;-><init>(Lc/a/a/a/p0/d;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, p0, Lc/a/a/a/p0/d;->g:Lcom/google/android/material/textfield/TextInputLayout$f;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/textfield/TextInputLayout$f;)V

    .line 28
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, p0, Lc/a/a/a/p0/d;->h:Lcom/google/android/material/textfield/TextInputLayout$g;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/textfield/TextInputLayout$g;)V

    .line 29
    invoke-virtual {p0}, Lc/a/a/a/p0/d;->c()V

    .line 30
    iget-object v0, p0, Lc/a/a/a/p0/e;->b:Landroid/content/Context;

    const-string v1, "accessibility"

    .line 31
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    iput-object v0, p0, Lc/a/a/a/p0/d;->n:Landroid/view/accessibility/AccessibilityManager;

    return-void
.end method

.method public final a(Landroid/widget/AutoCompleteTextView;)V
    .registers 11

    .line 32
    invoke-static {p1}, Lc/a/a/a/p0/d;->d(Landroid/widget/EditText;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 33
    :cond_7
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->getBoxBackgroundMode()I

    move-result v0

    .line 34
    iget-object v1, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v1}, Lcom/google/android/material/textfield/TextInputLayout;->getBoxBackground()Lc/a/a/a/l0/h;

    move-result-object v1

    .line 35
    sget v2, Lc/a/a/a/b;->colorControlHighlight:I

    invoke-static {p1, v2}, Lc/a/a/a/w/a;->a(Landroid/view/View;I)I

    move-result v2

    const/4 v3, 0x2

    new-array v4, v3, [[I

    const/4 v5, 0x1

    new-array v6, v5, [I

    const v7, 0x10100a7

    const/4 v8, 0x0

    aput v7, v6, v8

    aput-object v6, v4, v8

    new-array v6, v8, [I

    aput-object v6, v4, v5

    if-ne v0, v3, :cond_31

    .line 36
    invoke-virtual {p0, p1, v2, v4, v1}, Lc/a/a/a/p0/d;->b(Landroid/widget/AutoCompleteTextView;I[[ILc/a/a/a/l0/h;)V

    goto :goto_36

    :cond_31
    if-ne v0, v5, :cond_36

    .line 37
    invoke-virtual {p0, p1, v2, v4, v1}, Lc/a/a/a/p0/d;->a(Landroid/widget/AutoCompleteTextView;I[[ILc/a/a/a/l0/h;)V

    :cond_36
    :goto_36
    return-void
.end method

.method public final a(Landroid/widget/AutoCompleteTextView;I[[ILc/a/a/a/l0/h;)V
    .registers 10

    .line 38
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->getBoxBackgroundColor()I

    move-result v0

    const v1, 0x3dcccccd    # 0.1f

    .line 39
    invoke-static {p2, v0, v1}, Lc/a/a/a/w/a;->a(IIF)I

    move-result p2

    const/4 v1, 0x2

    new-array v2, v1, [I

    const/4 v3, 0x0

    aput p2, v2, v3

    const/4 p2, 0x1

    aput v0, v2, p2

    .line 40
    sget-boolean v0, Lc/a/a/a/p0/d;->q:Z

    if-eqz v0, :cond_28

    .line 41
    new-instance p2, Landroid/content/res/ColorStateList;

    invoke-direct {p2, p3, v2}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 42
    new-instance p3, Landroid/graphics/drawable/RippleDrawable;

    invoke-direct {p3, p2, p4, p4}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 43
    invoke-static {p1, p3}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    goto :goto_5a

    .line 44
    :cond_28
    new-instance v0, Lc/a/a/a/l0/h;

    .line 45
    invoke-virtual {p4}, Lc/a/a/a/l0/h;->n()Lc/a/a/a/l0/m;

    move-result-object v4

    invoke-direct {v0, v4}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/m;)V

    .line 46
    new-instance v4, Landroid/content/res/ColorStateList;

    invoke-direct {v4, p3, v2}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v0, v4}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    new-array p3, v1, [Landroid/graphics/drawable/Drawable;

    aput-object p4, p3, v3

    aput-object v0, p3, p2

    .line 47
    new-instance p2, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {p2, p3}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 48
    invoke-static {p1}, Lb/h/m/y;->x(Landroid/view/View;)I

    move-result p3

    .line 49
    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->getPaddingTop()I

    move-result p4

    .line 50
    invoke-static {p1}, Lb/h/m/y;->w(Landroid/view/View;)I

    move-result v0

    .line 51
    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->getPaddingBottom()I

    move-result v1

    .line 52
    invoke-static {p1, p2}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 53
    invoke-static {p1, p3, p4, v0, v1}, Lb/h/m/y;->a(Landroid/view/View;IIII)V

    :goto_5a
    return-void
.end method

.method public a(I)Z
    .registers 2

    if-eqz p1, :cond_4

    const/4 p1, 0x1

    goto :goto_5

    :cond_4
    const/4 p1, 0x0

    :goto_5
    return p1
.end method

.method public final b(Landroid/widget/AutoCompleteTextView;)V
    .registers 4

    .line 5
    sget-boolean v0, Lc/a/a/a/p0/d;->q:Z

    if-eqz v0, :cond_1b

    .line 6
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->getBoxBackgroundMode()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_13

    .line 7
    iget-object v0, p0, Lc/a/a/a/p0/d;->m:Lc/a/a/a/l0/h;

    invoke-virtual {p1, v0}, Landroid/widget/AutoCompleteTextView;->setDropDownBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1b

    :cond_13
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1b

    .line 8
    iget-object v0, p0, Lc/a/a/a/p0/d;->l:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {p1, v0}, Landroid/widget/AutoCompleteTextView;->setDropDownBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_1b
    :goto_1b
    return-void
.end method

.method public final b(Landroid/widget/AutoCompleteTextView;I[[ILc/a/a/a/l0/h;)V
    .registers 12

    .line 9
    sget v0, Lc/a/a/a/b;->colorSurface:I

    invoke-static {p1, v0}, Lc/a/a/a/w/a;->a(Landroid/view/View;I)I

    move-result v0

    .line 10
    new-instance v1, Lc/a/a/a/l0/h;

    .line 11
    invoke-virtual {p4}, Lc/a/a/a/l0/h;->n()Lc/a/a/a/l0/m;

    move-result-object v2

    invoke-direct {v1, v2}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/m;)V

    const v2, 0x3dcccccd    # 0.1f

    .line 12
    invoke-static {p2, v0, v2}, Lc/a/a/a/w/a;->a(IIF)I

    move-result p2

    const/4 v2, 0x2

    new-array v3, v2, [I

    const/4 v4, 0x0

    aput p2, v3, v4

    const/4 v5, 0x1

    aput v4, v3, v5

    .line 13
    new-instance v6, Landroid/content/res/ColorStateList;

    invoke-direct {v6, p3, v3}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v1, v6}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    .line 14
    sget-boolean v3, Lc/a/a/a/p0/d;->q:Z

    if-eqz v3, :cond_57

    .line 15
    invoke-virtual {v1, v0}, Lc/a/a/a/l0/h;->setTint(I)V

    new-array v3, v2, [I

    aput p2, v3, v4

    aput v0, v3, v5

    .line 16
    new-instance p2, Landroid/content/res/ColorStateList;

    invoke-direct {p2, p3, v3}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 17
    new-instance p3, Lc/a/a/a/l0/h;

    .line 18
    invoke-virtual {p4}, Lc/a/a/a/l0/h;->n()Lc/a/a/a/l0/m;

    move-result-object v0

    invoke-direct {p3, v0}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/m;)V

    const/4 v0, -0x1

    .line 19
    invoke-virtual {p3, v0}, Lc/a/a/a/l0/h;->setTint(I)V

    .line 20
    new-instance v0, Landroid/graphics/drawable/RippleDrawable;

    invoke-direct {v0, p2, v1, p3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    new-array p2, v2, [Landroid/graphics/drawable/Drawable;

    aput-object v0, p2, v4

    aput-object p4, p2, v5

    .line 21
    new-instance p3, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {p3, p2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    goto :goto_62

    :cond_57
    new-array p2, v2, [Landroid/graphics/drawable/Drawable;

    aput-object v1, p2, v4

    aput-object p4, p2, v5

    .line 22
    new-instance p3, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {p3, p2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 23
    :goto_62
    invoke-static {p1, p3}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final b(Z)V
    .registers 3

    .line 24
    iget-boolean v0, p0, Lc/a/a/a/p0/d;->j:Z

    if-eq v0, p1, :cond_10

    .line 25
    iput-boolean p1, p0, Lc/a/a/a/p0/d;->j:Z

    .line 26
    iget-object p1, p0, Lc/a/a/a/p0/d;->p:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 27
    iget-object p1, p0, Lc/a/a/a/p0/d;->o:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    :cond_10
    return-void
.end method

.method public b()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public final c()V
    .registers 4

    const/4 v0, 0x2

    new-array v1, v0, [F

    .line 10
    fill-array-data v1, :array_24

    const/16 v2, 0x43

    invoke-virtual {p0, v2, v1}, Lc/a/a/a/p0/d;->a(I[F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lc/a/a/a/p0/d;->p:Landroid/animation/ValueAnimator;

    new-array v0, v0, [F

    .line 11
    fill-array-data v0, :array_2c

    const/16 v1, 0x32

    invoke-virtual {p0, v1, v0}, Lc/a/a/a/p0/d;->a(I[F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/p0/d;->o:Landroid/animation/ValueAnimator;

    .line 12
    new-instance v1, Lc/a/a/a/p0/d$j;

    invoke-direct {v1, p0}, Lc/a/a/a/p0/d$j;-><init>(Lc/a/a/a/p0/d;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void

    :array_24
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_2c
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final c(Landroid/widget/AutoCompleteTextView;)V
    .registers 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 3
    new-instance v0, Lc/a/a/a/p0/d$h;

    invoke-direct {v0, p0, p1}, Lc/a/a/a/p0/d$h;-><init>(Lc/a/a/a/p0/d;Landroid/widget/AutoCompleteTextView;)V

    invoke-virtual {p1, v0}, Landroid/widget/AutoCompleteTextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 4
    iget-object v0, p0, Lc/a/a/a/p0/d;->e:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {p1, v0}, Landroid/widget/AutoCompleteTextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 5
    sget-boolean v0, Lc/a/a/a/p0/d;->q:Z

    if-eqz v0, :cond_19

    .line 6
    new-instance v0, Lc/a/a/a/p0/d$i;

    invoke-direct {v0, p0}, Lc/a/a/a/p0/d$i;-><init>(Lc/a/a/a/p0/d;)V

    invoke-virtual {p1, v0}, Landroid/widget/AutoCompleteTextView;->setOnDismissListener(Landroid/widget/AutoCompleteTextView$OnDismissListener;)V

    :cond_19
    return-void
.end method

.method public final d(Landroid/widget/AutoCompleteTextView;)V
    .registers 4

    if-nez p1, :cond_3

    return-void

    .line 3
    :cond_3
    invoke-virtual {p0}, Lc/a/a/a/p0/d;->d()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    .line 4
    iput-boolean v1, p0, Lc/a/a/a/p0/d;->i:Z

    .line 5
    :cond_c
    iget-boolean v0, p0, Lc/a/a/a/p0/d;->i:Z

    if-nez v0, :cond_36

    .line 6
    sget-boolean v0, Lc/a/a/a/p0/d;->q:Z

    if-eqz v0, :cond_1c

    .line 7
    iget-boolean v0, p0, Lc/a/a/a/p0/d;->j:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lc/a/a/a/p0/d;->b(Z)V

    goto :goto_27

    .line 8
    :cond_1c
    iget-boolean v0, p0, Lc/a/a/a/p0/d;->j:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lc/a/a/a/p0/d;->j:Z

    .line 9
    iget-object v0, p0, Lc/a/a/a/p0/e;->c:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Lcom/google/android/material/internal/CheckableImageButton;->toggle()V

    .line 10
    :goto_27
    iget-boolean v0, p0, Lc/a/a/a/p0/d;->j:Z

    if-eqz v0, :cond_32

    .line 11
    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->requestFocus()Z

    .line 12
    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->showDropDown()V

    goto :goto_38

    .line 13
    :cond_32
    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    goto :goto_38

    .line 14
    :cond_36
    iput-boolean v1, p0, Lc/a/a/a/p0/d;->i:Z

    :goto_38
    return-void
.end method

.method public final d()Z
    .registers 6

    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lc/a/a/a/p0/d;->k:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-ltz v4, :cond_16

    const-wide/16 v2, 0x12c

    cmp-long v4, v0, v2

    if-lez v4, :cond_14

    goto :goto_16

    :cond_14
    const/4 v0, 0x0

    goto :goto_17

    :cond_16
    :goto_16
    const/4 v0, 0x1

    :goto_17
    return v0
.end method
