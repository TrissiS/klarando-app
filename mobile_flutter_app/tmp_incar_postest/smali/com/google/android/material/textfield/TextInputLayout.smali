.class public Lcom/google/android/material/textfield/TextInputLayout;
.super Landroid/widget/LinearLayout;
.source "TextInputLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/textfield/TextInputLayout$e;,
        Lcom/google/android/material/textfield/TextInputLayout$SavedState;,
        Lcom/google/android/material/textfield/TextInputLayout$g;,
        Lcom/google/android/material/textfield/TextInputLayout$f;
    }
.end annotation


# static fields
.field public static final T0:I


# instance fields
.field public A:I

.field public A0:Landroid/content/res/ColorStateList;

.field public B:Landroid/content/res/ColorStateList;

.field public B0:Landroid/content/res/ColorStateList;

.field public C:Landroid/content/res/ColorStateList;

.field public C0:Landroid/content/res/ColorStateList;

.field public D:Ljava/lang/CharSequence;

.field public D0:I

.field public final E:Landroid/widget/TextView;

.field public E0:I

.field public F:Ljava/lang/CharSequence;

.field public F0:I

.field public final G:Landroid/widget/TextView;

.field public G0:Landroid/content/res/ColorStateList;

.field public H:Z

.field public H0:I

.field public I:Ljava/lang/CharSequence;

.field public I0:I

.field public J:Z

.field public J0:I

.field public K:Lc/a/a/a/l0/h;

.field public K0:I

.field public L:Lc/a/a/a/l0/h;

.field public L0:I

.field public M:Lc/a/a/a/l0/m;

.field public M0:Z

.field public final N:I

.field public final N0:Lc/a/a/a/d0/a;

.field public O:I

.field public O0:Z

.field public P:I

.field public P0:Z

.field public Q:I

.field public Q0:Landroid/animation/ValueAnimator;

.field public R:I

.field public R0:Z

.field public S:I

.field public S0:Z

.field public T:I

.field public U:I

.field public V:I

.field public final W:Landroid/graphics/Rect;

.field public final a0:Landroid/graphics/Rect;

.field public final b0:Landroid/graphics/RectF;

.field public c0:Landroid/graphics/Typeface;

.field public final d0:Lcom/google/android/material/internal/CheckableImageButton;

.field public e0:Landroid/content/res/ColorStateList;

.field public f0:Z

.field public g0:Landroid/graphics/PorterDuff$Mode;

.field public final h:Landroid/widget/FrameLayout;

.field public h0:Z

.field public final i:Landroid/widget/LinearLayout;

.field public i0:Landroid/graphics/drawable/Drawable;

.field public final j:Landroid/widget/LinearLayout;

.field public j0:I

.field public final k:Landroid/widget/FrameLayout;

.field public k0:Landroid/view/View$OnLongClickListener;

.field public l:Landroid/widget/EditText;

.field public final l0:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Lcom/google/android/material/textfield/TextInputLayout$f;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ljava/lang/CharSequence;

.field public m0:I

.field public n:I

.field public final n0:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lc/a/a/a/p0/e;",
            ">;"
        }
    .end annotation
.end field

.field public o:I

.field public final o0:Lcom/google/android/material/internal/CheckableImageButton;

.field public final p:Lc/a/a/a/p0/f;

.field public final p0:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Lcom/google/android/material/textfield/TextInputLayout$g;",
            ">;"
        }
    .end annotation
.end field

.field public q:Z

.field public q0:Landroid/content/res/ColorStateList;

.field public r:I

.field public r0:Z

.field public s:Z

.field public s0:Landroid/graphics/PorterDuff$Mode;

.field public t:Landroid/widget/TextView;

.field public t0:Z

.field public u:I

.field public u0:Landroid/graphics/drawable/Drawable;

.field public v:I

.field public v0:I

.field public w:Ljava/lang/CharSequence;

.field public w0:Landroid/graphics/drawable/Drawable;

.field public x:Z

.field public x0:Landroid/view/View$OnLongClickListener;

.field public y:Landroid/widget/TextView;

.field public y0:Landroid/view/View$OnLongClickListener;

.field public z:Landroid/content/res/ColorStateList;

.field public final z0:Lcom/google/android/material/internal/CheckableImageButton;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    sget v0, Lc/a/a/a/k;->Widget_Design_TextInputLayout:I

    sput v0, Lcom/google/android/material/textfield/TextInputLayout;->T0:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/textfield/TextInputLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lc/a/a/a/b;->textInputStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/textfield/TextInputLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v7, p2

    move/from16 v8, p3

    .line 3
    sget v1, Lcom/google/android/material/textfield/TextInputLayout;->T0:I

    move-object/from16 v2, p1

    invoke-static {v2, v7, v8, v1}, Lc/a/a/a/q0/a/a;->b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, v7, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v9, -0x1

    .line 4
    iput v9, v0, Lcom/google/android/material/textfield/TextInputLayout;->n:I

    .line 5
    iput v9, v0, Lcom/google/android/material/textfield/TextInputLayout;->o:I

    .line 6
    new-instance v1, Lc/a/a/a/p0/f;

    invoke-direct {v1, v0}, Lc/a/a/a/p0/f;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    .line 7
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->W:Landroid/graphics/Rect;

    .line 8
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->a0:Landroid/graphics/Rect;

    .line 9
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->b0:Landroid/graphics/RectF;

    .line 10
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->l0:Ljava/util/LinkedHashSet;

    const/4 v10, 0x0

    .line 11
    iput v10, v0, Lcom/google/android/material/textfield/TextInputLayout;->m0:I

    .line 12
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->n0:Landroid/util/SparseArray;

    .line 13
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->p0:Ljava/util/LinkedHashSet;

    .line 14
    new-instance v1, Lc/a/a/a/d0/a;

    invoke-direct {v1, v0}, Lc/a/a/a/d0/a;-><init>(Landroid/view/View;)V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    .line 15
    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v11

    const/4 v12, 0x1

    .line 16
    invoke-virtual {v0, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 17
    invoke-virtual {v0, v10}, Landroid/widget/LinearLayout;->setWillNotDraw(Z)V

    .line 18
    invoke-virtual {v0, v12}, Landroid/widget/LinearLayout;->setAddStatesFromChildren(Z)V

    .line 19
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, v11}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->h:Landroid/widget/FrameLayout;

    .line 20
    invoke-virtual {v1, v12}, Landroid/widget/FrameLayout;->setAddStatesFromChildren(Z)V

    .line 21
    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->h:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 22
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v11}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->i:Landroid/widget/LinearLayout;

    .line 23
    invoke-virtual {v1, v10}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 24
    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->i:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v13, -0x2

    const v3, 0x800003

    invoke-direct {v2, v13, v9, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->h:Landroid/widget/FrameLayout;

    iget-object v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->i:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 26
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v11}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->j:Landroid/widget/LinearLayout;

    .line 27
    invoke-virtual {v1, v10}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 28
    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->j:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const v3, 0x800005

    invoke-direct {v2, v13, v9, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->h:Landroid/widget/FrameLayout;

    iget-object v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->j:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 30
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, v11}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->k:Landroid/widget/FrameLayout;

    .line 31
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v13, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    sget-object v2, Lc/a/a/a/m/a;->a:Landroid/animation/TimeInterpolator;

    invoke-virtual {v1, v2}, Lc/a/a/a/d0/a;->b(Landroid/animation/TimeInterpolator;)V

    .line 33
    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    sget-object v2, Lc/a/a/a/m/a;->a:Landroid/animation/TimeInterpolator;

    invoke-virtual {v1, v2}, Lc/a/a/a/d0/a;->a(Landroid/animation/TimeInterpolator;)V

    .line 34
    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    const v2, 0x800033

    invoke-virtual {v1, v2}, Lc/a/a/a/d0/a;->b(I)V

    .line 35
    sget-object v3, Lc/a/a/a/l;->TextInputLayout:[I

    sget v5, Lcom/google/android/material/textfield/TextInputLayout;->T0:I

    const/4 v1, 0x5

    new-array v6, v1, [I

    sget v1, Lc/a/a/a/l;->TextInputLayout_counterTextAppearance:I

    aput v1, v6, v10

    sget v1, Lc/a/a/a/l;->TextInputLayout_counterOverflowTextAppearance:I

    aput v1, v6, v12

    sget v1, Lc/a/a/a/l;->TextInputLayout_errorTextAppearance:I

    const/4 v14, 0x2

    aput v1, v6, v14

    sget v1, Lc/a/a/a/l;->TextInputLayout_helperTextTextAppearance:I

    const/4 v15, 0x3

    aput v1, v6, v15

    sget v1, Lc/a/a/a/l;->TextInputLayout_hintTextAppearance:I

    const/4 v2, 0x4

    aput v1, v6, v2

    move-object v1, v11

    move-object/from16 v2, p2

    move/from16 v4, p3

    .line 36
    invoke-static/range {v1 .. v6}, Lc/a/a/a/d0/m;->d(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Lb/b/q/g0;

    move-result-object v1

    .line 37
    sget v2, Lc/a/a/a/l;->TextInputLayout_hintEnabled:I

    invoke-virtual {v1, v2, v12}, Lb/b/q/g0;->a(IZ)Z

    move-result v2

    iput-boolean v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->H:Z

    .line 38
    sget v2, Lc/a/a/a/l;->TextInputLayout_android_hint:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    .line 39
    sget v2, Lc/a/a/a/l;->TextInputLayout_hintAnimationEnabled:I

    invoke-virtual {v1, v2, v12}, Lb/b/q/g0;->a(IZ)Z

    move-result v2

    iput-boolean v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->P0:Z

    .line 40
    sget v2, Lc/a/a/a/l;->TextInputLayout_expandedHintEnabled:I

    invoke-virtual {v1, v2, v12}, Lb/b/q/g0;->a(IZ)Z

    move-result v2

    iput-boolean v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->O0:Z

    .line 41
    sget v2, Lc/a/a/a/l;->TextInputLayout_android_minWidth:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_129

    .line 42
    sget v2, Lc/a/a/a/l;->TextInputLayout_android_minWidth:I

    invoke-virtual {v1, v2, v9}, Lb/b/q/g0;->c(II)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setMinWidth(I)V

    .line 43
    :cond_129
    sget v2, Lc/a/a/a/l;->TextInputLayout_android_maxWidth:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_13a

    .line 44
    sget v2, Lc/a/a/a/l;->TextInputLayout_android_maxWidth:I

    invoke-virtual {v1, v2, v9}, Lb/b/q/g0;->c(II)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setMaxWidth(I)V

    .line 45
    :cond_13a
    sget v2, Lcom/google/android/material/textfield/TextInputLayout;->T0:I

    .line 46
    invoke-static {v11, v7, v8, v2}, Lc/a/a/a/l0/m;->a(Landroid/content/Context;Landroid/util/AttributeSet;II)Lc/a/a/a/l0/m$b;

    move-result-object v2

    invoke-virtual {v2}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object v2

    iput-object v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->M:Lc/a/a/a/l0/m;

    .line 47
    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lc/a/a/a/d;->mtrl_textinput_box_label_cutout_padding:I

    .line 48
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    iput v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->N:I

    .line 49
    sget v2, Lc/a/a/a/l;->TextInputLayout_boxCollapsedPaddingTop:I

    .line 50
    invoke-virtual {v1, v2, v10}, Lb/b/q/g0;->b(II)I

    move-result v2

    iput v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->Q:I

    .line 51
    sget v2, Lc/a/a/a/l;->TextInputLayout_boxStrokeWidth:I

    .line 52
    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lc/a/a/a/d;->mtrl_textinput_box_stroke_width_default:I

    .line 53
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 54
    invoke-virtual {v1, v2, v3}, Lb/b/q/g0;->c(II)I

    move-result v2

    iput v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->S:I

    .line 55
    sget v2, Lc/a/a/a/l;->TextInputLayout_boxStrokeWidthFocused:I

    .line 56
    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lc/a/a/a/d;->mtrl_textinput_box_stroke_width_focused:I

    .line 57
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 58
    invoke-virtual {v1, v2, v3}, Lb/b/q/g0;->c(II)I

    move-result v2

    iput v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->T:I

    .line 59
    iget v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->S:I

    iput v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->R:I

    .line 60
    sget v2, Lc/a/a/a/l;->TextInputLayout_boxCornerRadiusTopStart:I

    const/high16 v3, -0x40800000    # -1.0f

    .line 61
    invoke-virtual {v1, v2, v3}, Lb/b/q/g0;->a(IF)F

    move-result v2

    .line 62
    sget v4, Lc/a/a/a/l;->TextInputLayout_boxCornerRadiusTopEnd:I

    .line 63
    invoke-virtual {v1, v4, v3}, Lb/b/q/g0;->a(IF)F

    move-result v4

    .line 64
    sget v5, Lc/a/a/a/l;->TextInputLayout_boxCornerRadiusBottomEnd:I

    .line 65
    invoke-virtual {v1, v5, v3}, Lb/b/q/g0;->a(IF)F

    move-result v5

    .line 66
    sget v6, Lc/a/a/a/l;->TextInputLayout_boxCornerRadiusBottomStart:I

    .line 67
    invoke-virtual {v1, v6, v3}, Lb/b/q/g0;->a(IF)F

    move-result v3

    .line 68
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->M:Lc/a/a/a/l0/m;

    invoke-virtual {v6}, Lc/a/a/a/l0/m;->m()Lc/a/a/a/l0/m$b;

    move-result-object v6

    const/4 v7, 0x0

    cmpl-float v8, v2, v7

    if-ltz v8, :cond_1aa

    .line 69
    invoke-virtual {v6, v2}, Lc/a/a/a/l0/m$b;->d(F)Lc/a/a/a/l0/m$b;

    :cond_1aa
    cmpl-float v2, v4, v7

    if-ltz v2, :cond_1b1

    .line 70
    invoke-virtual {v6, v4}, Lc/a/a/a/l0/m$b;->e(F)Lc/a/a/a/l0/m$b;

    :cond_1b1
    cmpl-float v2, v5, v7

    if-ltz v2, :cond_1b8

    .line 71
    invoke-virtual {v6, v5}, Lc/a/a/a/l0/m$b;->c(F)Lc/a/a/a/l0/m$b;

    :cond_1b8
    cmpl-float v2, v3, v7

    if-ltz v2, :cond_1bf

    .line 72
    invoke-virtual {v6, v3}, Lc/a/a/a/l0/m$b;->b(F)Lc/a/a/a/l0/m$b;

    .line 73
    :cond_1bf
    invoke-virtual {v6}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object v2

    iput-object v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->M:Lc/a/a/a/l0/m;

    .line 74
    sget v2, Lc/a/a/a/l;->TextInputLayout_boxBackgroundColor:I

    .line 75
    invoke-static {v11, v1, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Lb/b/q/g0;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    if-eqz v2, :cond_221

    .line 76
    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->H0:I

    .line 77
    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->V:I

    .line 78
    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v3

    const v4, -0x101009e

    if-eqz v3, :cond_1ff

    new-array v3, v12, [I

    aput v4, v3, v10

    .line 79
    invoke-virtual {v2, v3, v9}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->I0:I

    new-array v3, v14, [I

    .line 80
    fill-array-data v3, :array_676

    .line 81
    invoke-virtual {v2, v3, v9}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->J0:I

    new-array v3, v14, [I

    .line 82
    fill-array-data v3, :array_67e

    .line 83
    invoke-virtual {v2, v3, v9}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    iput v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->K0:I

    goto :goto_22b

    .line 84
    :cond_1ff
    iget v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->H0:I

    iput v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->J0:I

    .line 85
    sget v2, Lc/a/a/a/c;->mtrl_filled_background_color:I

    .line 86
    invoke-static {v11, v2}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    new-array v3, v12, [I

    aput v4, v3, v10

    .line 87
    invoke-virtual {v2, v3, v9}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->I0:I

    new-array v3, v12, [I

    const v4, 0x1010367

    aput v4, v3, v10

    .line 88
    invoke-virtual {v2, v3, v9}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    iput v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->K0:I

    goto :goto_22b

    .line 89
    :cond_221
    iput v10, v0, Lcom/google/android/material/textfield/TextInputLayout;->V:I

    .line 90
    iput v10, v0, Lcom/google/android/material/textfield/TextInputLayout;->H0:I

    .line 91
    iput v10, v0, Lcom/google/android/material/textfield/TextInputLayout;->I0:I

    .line 92
    iput v10, v0, Lcom/google/android/material/textfield/TextInputLayout;->J0:I

    .line 93
    iput v10, v0, Lcom/google/android/material/textfield/TextInputLayout;->K0:I

    .line 94
    :goto_22b
    sget v2, Lc/a/a/a/l;->TextInputLayout_android_textColorHint:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_23d

    .line 95
    sget v2, Lc/a/a/a/l;->TextInputLayout_android_textColorHint:I

    .line 96
    invoke-virtual {v1, v2}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    iput-object v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->C0:Landroid/content/res/ColorStateList;

    iput-object v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->B0:Landroid/content/res/ColorStateList;

    .line 97
    :cond_23d
    sget v2, Lc/a/a/a/l;->TextInputLayout_boxStrokeColor:I

    .line 98
    invoke-static {v11, v1, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Lb/b/q/g0;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .line 99
    sget v3, Lc/a/a/a/l;->TextInputLayout_boxStrokeColor:I

    invoke-virtual {v1, v3, v10}, Lb/b/q/g0;->a(II)I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->F0:I

    .line 100
    sget v3, Lc/a/a/a/c;->mtrl_textinput_default_box_stroke_color:I

    .line 101
    invoke-static {v11, v3}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->D0:I

    .line 102
    sget v3, Lc/a/a/a/c;->mtrl_textinput_disabled_color:I

    invoke-static {v11, v3}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->L0:I

    .line 103
    sget v3, Lc/a/a/a/c;->mtrl_textinput_hovered_box_stroke_color:I

    .line 104
    invoke-static {v11, v3}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->E0:I

    if-eqz v2, :cond_268

    .line 105
    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setBoxStrokeColorStateList(Landroid/content/res/ColorStateList;)V

    .line 106
    :cond_268
    sget v2, Lc/a/a/a/l;->TextInputLayout_boxStrokeErrorColor:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_279

    .line 107
    sget v2, Lc/a/a/a/l;->TextInputLayout_boxStrokeErrorColor:I

    .line 108
    invoke-static {v11, v1, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Lb/b/q/g0;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .line 109
    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setBoxStrokeErrorColor(Landroid/content/res/ColorStateList;)V

    .line 110
    :cond_279
    sget v2, Lc/a/a/a/l;->TextInputLayout_hintTextAppearance:I

    invoke-virtual {v1, v2, v9}, Lb/b/q/g0;->g(II)I

    move-result v2

    if-eq v2, v9, :cond_28a

    .line 111
    sget v2, Lc/a/a/a/l;->TextInputLayout_hintTextAppearance:I

    invoke-virtual {v1, v2, v10}, Lb/b/q/g0;->g(II)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setHintTextAppearance(I)V

    .line 112
    :cond_28a
    sget v2, Lc/a/a/a/l;->TextInputLayout_errorTextAppearance:I

    .line 113
    invoke-virtual {v1, v2, v10}, Lb/b/q/g0;->g(II)I

    move-result v2

    .line 114
    sget v3, Lc/a/a/a/l;->TextInputLayout_errorContentDescription:I

    .line 115
    invoke-virtual {v1, v3}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object v3

    .line 116
    sget v4, Lc/a/a/a/l;->TextInputLayout_errorEnabled:I

    invoke-virtual {v1, v4, v10}, Lb/b/q/g0;->a(IZ)Z

    move-result v4

    .line 117
    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    sget v6, Lc/a/a/a/h;->design_text_input_end_icon:I

    iget-object v7, v0, Lcom/google/android/material/textfield/TextInputLayout;->j:Landroid/widget/LinearLayout;

    .line 118
    invoke-virtual {v5, v6, v7, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/google/android/material/internal/CheckableImageButton;

    iput-object v5, v0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    .line 119
    sget v6, Lc/a/a/a/f;->text_input_error_icon:I

    invoke-virtual {v5, v6}, Landroid/widget/ImageButton;->setId(I)V

    .line 120
    iget-object v5, v0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 121
    invoke-static {v11}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_2cd

    .line 122
    iget-object v5, v0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    .line 123
    invoke-virtual {v5}, Landroid/widget/ImageButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 124
    invoke-static {v5, v10}, Lb/h/m/h;->b(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    .line 125
    :cond_2cd
    sget v5, Lc/a/a/a/l;->TextInputLayout_errorIconDrawable:I

    invoke-virtual {v1, v5}, Lb/b/q/g0;->g(I)Z

    move-result v5

    if-eqz v5, :cond_2de

    .line 126
    sget v5, Lc/a/a/a/l;->TextInputLayout_errorIconDrawable:I

    invoke-virtual {v1, v5}, Lb/b/q/g0;->b(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 127
    :cond_2de
    sget v5, Lc/a/a/a/l;->TextInputLayout_errorIconTint:I

    invoke-virtual {v1, v5}, Lb/b/q/g0;->g(I)Z

    move-result v5

    if-eqz v5, :cond_2ef

    .line 128
    sget v5, Lc/a/a/a/l;->TextInputLayout_errorIconTint:I

    .line 129
    invoke-static {v11, v1, v5}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Lb/b/q/g0;I)Landroid/content/res/ColorStateList;

    move-result-object v5

    .line 130
    invoke-virtual {v0, v5}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorIconTintList(Landroid/content/res/ColorStateList;)V

    .line 131
    :cond_2ef
    sget v5, Lc/a/a/a/l;->TextInputLayout_errorIconTintMode:I

    invoke-virtual {v1, v5}, Lb/b/q/g0;->g(I)Z

    move-result v5

    const/4 v7, 0x0

    if-eqz v5, :cond_305

    .line 132
    sget v5, Lc/a/a/a/l;->TextInputLayout_errorIconTintMode:I

    .line 133
    invoke-virtual {v1, v5, v9}, Lb/b/q/g0;->d(II)I

    move-result v5

    .line 134
    invoke-static {v5, v7}, Lc/a/a/a/d0/t;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v5

    .line 135
    invoke-virtual {v0, v5}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorIconTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 136
    :cond_305
    iget-object v5, v0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    .line 137
    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    sget v13, Lc/a/a/a/j;->error_icon_content_description:I

    invoke-virtual {v8, v13}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v8

    .line 138
    invoke-virtual {v5, v8}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 139
    iget-object v5, v0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {v5, v14}, Lb/h/m/y;->h(Landroid/view/View;I)V

    .line 140
    iget-object v5, v0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v5, v10}, Landroid/widget/ImageButton;->setClickable(Z)V

    .line 141
    iget-object v5, v0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v5, v10}, Lcom/google/android/material/internal/CheckableImageButton;->setPressable(Z)V

    .line 142
    iget-object v5, v0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v5, v10}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 143
    sget v5, Lc/a/a/a/l;->TextInputLayout_helperTextTextAppearance:I

    .line 144
    invoke-virtual {v1, v5, v10}, Lb/b/q/g0;->g(II)I

    move-result v5

    .line 145
    sget v8, Lc/a/a/a/l;->TextInputLayout_helperTextEnabled:I

    .line 146
    invoke-virtual {v1, v8, v10}, Lb/b/q/g0;->a(IZ)Z

    move-result v8

    .line 147
    sget v13, Lc/a/a/a/l;->TextInputLayout_helperText:I

    invoke-virtual {v1, v13}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object v13

    .line 148
    sget v15, Lc/a/a/a/l;->TextInputLayout_placeholderTextAppearance:I

    .line 149
    invoke-virtual {v1, v15, v10}, Lb/b/q/g0;->g(II)I

    move-result v15

    .line 150
    sget v14, Lc/a/a/a/l;->TextInputLayout_placeholderText:I

    invoke-virtual {v1, v14}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object v14

    .line 151
    sget v12, Lc/a/a/a/l;->TextInputLayout_prefixTextAppearance:I

    .line 152
    invoke-virtual {v1, v12, v10}, Lb/b/q/g0;->g(II)I

    move-result v12

    .line 153
    sget v7, Lc/a/a/a/l;->TextInputLayout_prefixText:I

    invoke-virtual {v1, v7}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object v7

    .line 154
    sget v6, Lc/a/a/a/l;->TextInputLayout_suffixTextAppearance:I

    .line 155
    invoke-virtual {v1, v6, v10}, Lb/b/q/g0;->g(II)I

    move-result v6

    .line 156
    sget v9, Lc/a/a/a/l;->TextInputLayout_suffixText:I

    invoke-virtual {v1, v9}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object v9

    move/from16 v16, v6

    .line 157
    sget v6, Lc/a/a/a/l;->TextInputLayout_counterEnabled:I

    invoke-virtual {v1, v6, v10}, Lb/b/q/g0;->a(IZ)Z

    move-result v6

    .line 158
    sget v10, Lc/a/a/a/l;->TextInputLayout_counterMaxLength:I

    move/from16 v17, v6

    const/4 v6, -0x1

    invoke-virtual {v1, v10, v6}, Lb/b/q/g0;->d(II)I

    move-result v10

    invoke-virtual {v0, v10}, Lcom/google/android/material/textfield/TextInputLayout;->setCounterMaxLength(I)V

    .line 159
    sget v6, Lc/a/a/a/l;->TextInputLayout_counterTextAppearance:I

    const/4 v10, 0x0

    invoke-virtual {v1, v6, v10}, Lb/b/q/g0;->g(II)I

    move-result v6

    iput v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->v:I

    .line 160
    sget v6, Lc/a/a/a/l;->TextInputLayout_counterOverflowTextAppearance:I

    .line 161
    invoke-virtual {v1, v6, v10}, Lb/b/q/g0;->g(II)I

    move-result v6

    iput v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->u:I

    .line 162
    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    move-object/from16 v18, v9

    sget v9, Lc/a/a/a/h;->design_text_input_start_icon:I

    move/from16 v19, v12

    iget-object v12, v0, Lcom/google/android/material/textfield/TextInputLayout;->i:Landroid/widget/LinearLayout;

    .line 163
    invoke-virtual {v6, v9, v12, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/google/android/material/internal/CheckableImageButton;

    iput-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->d0:Lcom/google/android/material/internal/CheckableImageButton;

    const/16 v9, 0x8

    .line 164
    invoke-virtual {v6, v9}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 165
    invoke-static {v11}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_3b1

    .line 166
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->d0:Lcom/google/android/material/internal/CheckableImageButton;

    .line 167
    invoke-virtual {v6}, Landroid/widget/ImageButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 168
    invoke-static {v6, v10}, Lb/h/m/h;->a(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    :cond_3b1
    const/4 v6, 0x0

    .line 169
    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 170
    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 171
    sget v6, Lc/a/a/a/l;->TextInputLayout_startIconDrawable:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->g(I)Z

    move-result v6

    if-eqz v6, :cond_3e4

    .line 172
    sget v6, Lc/a/a/a/l;->TextInputLayout_startIconDrawable:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->b(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 173
    sget v6, Lc/a/a/a/l;->TextInputLayout_startIconContentDescription:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->g(I)Z

    move-result v6

    if-eqz v6, :cond_3da

    .line 174
    sget v6, Lc/a/a/a/l;->TextInputLayout_startIconContentDescription:I

    .line 175
    invoke-virtual {v1, v6}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object v6

    .line 176
    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconContentDescription(Ljava/lang/CharSequence;)V

    .line 177
    :cond_3da
    sget v6, Lc/a/a/a/l;->TextInputLayout_startIconCheckable:I

    const/4 v9, 0x1

    invoke-virtual {v1, v6, v9}, Lb/b/q/g0;->a(IZ)Z

    move-result v6

    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconCheckable(Z)V

    .line 178
    :cond_3e4
    sget v6, Lc/a/a/a/l;->TextInputLayout_startIconTint:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->g(I)Z

    move-result v6

    if-eqz v6, :cond_3f5

    .line 179
    sget v6, Lc/a/a/a/l;->TextInputLayout_startIconTint:I

    .line 180
    invoke-static {v11, v1, v6}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Lb/b/q/g0;I)Landroid/content/res/ColorStateList;

    move-result-object v6

    .line 181
    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconTintList(Landroid/content/res/ColorStateList;)V

    .line 182
    :cond_3f5
    sget v6, Lc/a/a/a/l;->TextInputLayout_startIconTintMode:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->g(I)Z

    move-result v6

    if-eqz v6, :cond_40c

    .line 183
    sget v6, Lc/a/a/a/l;->TextInputLayout_startIconTintMode:I

    const/4 v9, -0x1

    .line 184
    invoke-virtual {v1, v6, v9}, Lb/b/q/g0;->d(II)I

    move-result v6

    const/4 v9, 0x0

    .line 185
    invoke-static {v6, v9}, Lc/a/a/a/d0/t;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v6

    .line 186
    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 187
    :cond_40c
    sget v6, Lc/a/a/a/l;->TextInputLayout_boxBackgroundMode:I

    const/4 v9, 0x0

    .line 188
    invoke-virtual {v1, v6, v9}, Lb/b/q/g0;->d(II)I

    move-result v6

    .line 189
    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setBoxBackgroundMode(I)V

    .line 190
    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    sget v10, Lc/a/a/a/h;->design_text_input_end_icon:I

    iget-object v12, v0, Lcom/google/android/material/textfield/TextInputLayout;->k:Landroid/widget/FrameLayout;

    .line 191
    invoke-virtual {v6, v10, v12, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/google/android/material/internal/CheckableImageButton;

    iput-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    .line 192
    iget-object v9, v0, Lcom/google/android/material/textfield/TextInputLayout;->k:Landroid/widget/FrameLayout;

    invoke-virtual {v9, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 193
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    const/16 v9, 0x8

    invoke-virtual {v6, v9}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 194
    invoke-static {v11}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_449

    .line 195
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    .line 196
    invoke-virtual {v6}, Landroid/widget/ImageButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v9, 0x0

    .line 197
    invoke-static {v6, v9}, Lb/h/m/h;->b(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    goto :goto_44a

    :cond_449
    const/4 v9, 0x0

    .line 198
    :goto_44a
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->n0:Landroid/util/SparseArray;

    new-instance v10, Lc/a/a/a/p0/b;

    invoke-direct {v10, v0}, Lc/a/a/a/p0/b;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    const/4 v12, -0x1

    invoke-virtual {v6, v12, v10}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 199
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->n0:Landroid/util/SparseArray;

    new-instance v10, Lc/a/a/a/p0/g;

    invoke-direct {v10, v0}, Lc/a/a/a/p0/g;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    invoke-virtual {v6, v9, v10}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 200
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->n0:Landroid/util/SparseArray;

    new-instance v9, Lc/a/a/a/p0/h;

    invoke-direct {v9, v0}, Lc/a/a/a/p0/h;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    const/4 v10, 0x1

    invoke-virtual {v6, v10, v9}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 201
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->n0:Landroid/util/SparseArray;

    new-instance v9, Lc/a/a/a/p0/a;

    invoke-direct {v9, v0}, Lc/a/a/a/p0/a;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    const/4 v10, 0x2

    invoke-virtual {v6, v10, v9}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 202
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->n0:Landroid/util/SparseArray;

    new-instance v9, Lc/a/a/a/p0/d;

    invoke-direct {v9, v0}, Lc/a/a/a/p0/d;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    const/4 v10, 0x3

    invoke-virtual {v6, v10, v9}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 203
    sget v6, Lc/a/a/a/l;->TextInputLayout_endIconMode:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->g(I)Z

    move-result v6

    if-eqz v6, :cond_4bf

    .line 204
    sget v6, Lc/a/a/a/l;->TextInputLayout_endIconMode:I

    const/4 v9, 0x0

    invoke-virtual {v1, v6, v9}, Lb/b/q/g0;->d(II)I

    move-result v6

    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconMode(I)V

    .line 205
    sget v6, Lc/a/a/a/l;->TextInputLayout_endIconDrawable:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->g(I)Z

    move-result v6

    if-eqz v6, :cond_4a3

    .line 206
    sget v6, Lc/a/a/a/l;->TextInputLayout_endIconDrawable:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->b(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 207
    :cond_4a3
    sget v6, Lc/a/a/a/l;->TextInputLayout_endIconContentDescription:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->g(I)Z

    move-result v6

    if-eqz v6, :cond_4b4

    .line 208
    sget v6, Lc/a/a/a/l;->TextInputLayout_endIconContentDescription:I

    .line 209
    invoke-virtual {v1, v6}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object v6

    .line 210
    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconContentDescription(Ljava/lang/CharSequence;)V

    .line 211
    :cond_4b4
    sget v6, Lc/a/a/a/l;->TextInputLayout_endIconCheckable:I

    const/4 v9, 0x1

    invoke-virtual {v1, v6, v9}, Lb/b/q/g0;->a(IZ)Z

    move-result v6

    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconCheckable(Z)V

    goto :goto_50b

    .line 212
    :cond_4bf
    sget v6, Lc/a/a/a/l;->TextInputLayout_passwordToggleEnabled:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->g(I)Z

    move-result v6

    if-eqz v6, :cond_50b

    .line 213
    sget v6, Lc/a/a/a/l;->TextInputLayout_passwordToggleEnabled:I

    const/4 v9, 0x0

    .line 214
    invoke-virtual {v1, v6, v9}, Lb/b/q/g0;->a(IZ)Z

    move-result v6

    .line 215
    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconMode(I)V

    .line 216
    sget v6, Lc/a/a/a/l;->TextInputLayout_passwordToggleDrawable:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->b(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 217
    sget v6, Lc/a/a/a/l;->TextInputLayout_passwordToggleContentDescription:I

    .line 218
    invoke-virtual {v1, v6}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object v6

    .line 219
    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconContentDescription(Ljava/lang/CharSequence;)V

    .line 220
    sget v6, Lc/a/a/a/l;->TextInputLayout_passwordToggleTint:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->g(I)Z

    move-result v6

    if-eqz v6, :cond_4f4

    .line 221
    sget v6, Lc/a/a/a/l;->TextInputLayout_passwordToggleTint:I

    .line 222
    invoke-static {v11, v1, v6}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Lb/b/q/g0;I)Landroid/content/res/ColorStateList;

    move-result-object v6

    .line 223
    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconTintList(Landroid/content/res/ColorStateList;)V

    .line 224
    :cond_4f4
    sget v6, Lc/a/a/a/l;->TextInputLayout_passwordToggleTintMode:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->g(I)Z

    move-result v6

    if-eqz v6, :cond_50b

    .line 225
    sget v6, Lc/a/a/a/l;->TextInputLayout_passwordToggleTintMode:I

    const/4 v9, -0x1

    .line 226
    invoke-virtual {v1, v6, v9}, Lb/b/q/g0;->d(II)I

    move-result v6

    const/4 v9, 0x0

    .line 227
    invoke-static {v6, v9}, Lc/a/a/a/d0/t;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v6

    .line 228
    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 229
    :cond_50b
    :goto_50b
    sget v6, Lc/a/a/a/l;->TextInputLayout_passwordToggleEnabled:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->g(I)Z

    move-result v6

    if-nez v6, :cond_53b

    .line 230
    sget v6, Lc/a/a/a/l;->TextInputLayout_endIconTint:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->g(I)Z

    move-result v6

    if-eqz v6, :cond_524

    .line 231
    sget v6, Lc/a/a/a/l;->TextInputLayout_endIconTint:I

    .line 232
    invoke-static {v11, v1, v6}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Lb/b/q/g0;I)Landroid/content/res/ColorStateList;

    move-result-object v6

    .line 233
    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconTintList(Landroid/content/res/ColorStateList;)V

    .line 234
    :cond_524
    sget v6, Lc/a/a/a/l;->TextInputLayout_endIconTintMode:I

    invoke-virtual {v1, v6}, Lb/b/q/g0;->g(I)Z

    move-result v6

    if-eqz v6, :cond_53b

    .line 235
    sget v6, Lc/a/a/a/l;->TextInputLayout_endIconTintMode:I

    const/4 v9, -0x1

    .line 236
    invoke-virtual {v1, v6, v9}, Lb/b/q/g0;->d(II)I

    move-result v6

    const/4 v9, 0x0

    .line 237
    invoke-static {v6, v9}, Lc/a/a/a/d0/t;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v6

    .line 238
    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 239
    :cond_53b
    new-instance v6, Landroidx/appcompat/widget/AppCompatTextView;

    invoke-direct {v6, v11}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->E:Landroid/widget/TextView;

    .line 240
    sget v9, Lc/a/a/a/f;->textinput_prefix_text:I

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setId(I)V

    .line 241
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->E:Landroid/widget/TextView;

    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v10, -0x2

    invoke-direct {v9, v10, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 242
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->E:Landroid/widget/TextView;

    const/4 v9, 0x1

    invoke-static {v6, v9}, Lb/h/m/y;->g(Landroid/view/View;I)V

    .line 243
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->i:Landroid/widget/LinearLayout;

    iget-object v9, v0, Lcom/google/android/material/textfield/TextInputLayout;->d0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 244
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->i:Landroid/widget/LinearLayout;

    iget-object v9, v0, Lcom/google/android/material/textfield/TextInputLayout;->E:Landroid/widget/TextView;

    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 245
    new-instance v6, Landroidx/appcompat/widget/AppCompatTextView;

    invoke-direct {v6, v11}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->G:Landroid/widget/TextView;

    .line 246
    sget v9, Lc/a/a/a/f;->textinput_suffix_text:I

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setId(I)V

    .line 247
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->G:Landroid/widget/TextView;

    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v10, 0x50

    const/4 v11, -0x2

    invoke-direct {v9, v11, v11, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 248
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->G:Landroid/widget/TextView;

    const/4 v9, 0x1

    invoke-static {v6, v9}, Lb/h/m/y;->g(Landroid/view/View;I)V

    .line 249
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->j:Landroid/widget/LinearLayout;

    iget-object v9, v0, Lcom/google/android/material/textfield/TextInputLayout;->G:Landroid/widget/TextView;

    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 250
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->j:Landroid/widget/LinearLayout;

    iget-object v9, v0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 251
    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->j:Landroid/widget/LinearLayout;

    iget-object v9, v0, Lcom/google/android/material/textfield/TextInputLayout;->k:Landroid/widget/FrameLayout;

    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 252
    invoke-virtual {v0, v8}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperTextEnabled(Z)V

    .line 253
    invoke-virtual {v0, v13}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperText(Ljava/lang/CharSequence;)V

    .line 254
    invoke-virtual {v0, v5}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperTextTextAppearance(I)V

    .line 255
    invoke-virtual {v0, v4}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorEnabled(Z)V

    .line 256
    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorTextAppearance(I)V

    .line 257
    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorContentDescription(Ljava/lang/CharSequence;)V

    .line 258
    iget v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->v:I

    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setCounterTextAppearance(I)V

    .line 259
    iget v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->u:I

    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setCounterOverflowTextAppearance(I)V

    .line 260
    invoke-virtual {v0, v14}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderText(Ljava/lang/CharSequence;)V

    .line 261
    invoke-virtual {v0, v15}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderTextAppearance(I)V

    .line 262
    invoke-virtual {v0, v7}, Lcom/google/android/material/textfield/TextInputLayout;->setPrefixText(Ljava/lang/CharSequence;)V

    move/from16 v2, v19

    .line 263
    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setPrefixTextAppearance(I)V

    move-object/from16 v2, v18

    .line 264
    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setSuffixText(Ljava/lang/CharSequence;)V

    move/from16 v2, v16

    .line 265
    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setSuffixTextAppearance(I)V

    .line 266
    sget v2, Lc/a/a/a/l;->TextInputLayout_errorTextColor:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_5df

    .line 267
    sget v2, Lc/a/a/a/l;->TextInputLayout_errorTextColor:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorTextColor(Landroid/content/res/ColorStateList;)V

    .line 268
    :cond_5df
    sget v2, Lc/a/a/a/l;->TextInputLayout_helperTextTextColor:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_5f0

    .line 269
    sget v2, Lc/a/a/a/l;->TextInputLayout_helperTextTextColor:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperTextColor(Landroid/content/res/ColorStateList;)V

    .line 270
    :cond_5f0
    sget v2, Lc/a/a/a/l;->TextInputLayout_hintTextColor:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_601

    .line 271
    sget v2, Lc/a/a/a/l;->TextInputLayout_hintTextColor:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    .line 272
    :cond_601
    sget v2, Lc/a/a/a/l;->TextInputLayout_counterTextColor:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_612

    .line 273
    sget v2, Lc/a/a/a/l;->TextInputLayout_counterTextColor:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setCounterTextColor(Landroid/content/res/ColorStateList;)V

    .line 274
    :cond_612
    sget v2, Lc/a/a/a/l;->TextInputLayout_counterOverflowTextColor:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_623

    .line 275
    sget v2, Lc/a/a/a/l;->TextInputLayout_counterOverflowTextColor:I

    .line 276
    invoke-virtual {v1, v2}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .line 277
    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setCounterOverflowTextColor(Landroid/content/res/ColorStateList;)V

    .line 278
    :cond_623
    sget v2, Lc/a/a/a/l;->TextInputLayout_placeholderTextColor:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_634

    .line 279
    sget v2, Lc/a/a/a/l;->TextInputLayout_placeholderTextColor:I

    .line 280
    invoke-virtual {v1, v2}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .line 281
    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderTextColor(Landroid/content/res/ColorStateList;)V

    .line 282
    :cond_634
    sget v2, Lc/a/a/a/l;->TextInputLayout_prefixTextColor:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_645

    .line 283
    sget v2, Lc/a/a/a/l;->TextInputLayout_prefixTextColor:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setPrefixTextColor(Landroid/content/res/ColorStateList;)V

    .line 284
    :cond_645
    sget v2, Lc/a/a/a/l;->TextInputLayout_suffixTextColor:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_656

    .line 285
    sget v2, Lc/a/a/a/l;->TextInputLayout_suffixTextColor:I

    invoke-virtual {v1, v2}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setSuffixTextColor(Landroid/content/res/ColorStateList;)V

    :cond_656
    move/from16 v2, v17

    .line 286
    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setCounterEnabled(Z)V

    .line 287
    sget v2, Lc/a/a/a/l;->TextInputLayout_android_enabled:I

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lb/b/q/g0;->a(IZ)Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setEnabled(Z)V

    .line 288
    invoke-virtual {v1}, Lb/b/q/g0;->b()V

    const/4 v1, 0x2

    .line 289
    invoke-static {v0, v1}, Lb/h/m/y;->h(Landroid/view/View;I)V

    .line 290
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_675

    .line 291
    invoke-static {v0, v3}, Lb/h/m/y;->i(Landroid/view/View;I)V

    :cond_675
    return-void

    :array_676
    .array-data 4
        0x101009c
        0x101009e
    .end array-data

    :array_67e
    .array-data 4
        0x1010367
        0x101009e
    .end array-data
.end method

.method public static a(Landroid/content/Context;Landroid/widget/TextView;IIZ)V
    .registers 7

    if-eqz p4, :cond_5

    .line 24
    sget p4, Lc/a/a/a/j;->character_counter_overflowed_content_description:I

    goto :goto_7

    :cond_5
    sget p4, Lc/a/a/a/j;->character_counter_content_description:I

    :goto_7
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 25
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v0, v1

    const/4 p2, 0x1

    .line 26
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v0, p2

    .line 27
    invoke-virtual {p0, p4, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static a(Landroid/view/ViewGroup;Z)V
    .registers 6

    .line 32
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_1a

    .line 33
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 34
    invoke-virtual {v2, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 35
    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_17

    .line 36
    check-cast v2, Landroid/view/ViewGroup;

    invoke-static {v2, p1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Landroid/view/ViewGroup;Z)V

    :cond_17
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_1a
    return-void
.end method

.method public static a(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)V
    .registers 3

    .line 78
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    invoke-static {p0, p2}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public static a(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V
    .registers 5

    .line 80
    invoke-static {p0}, Lb/h/m/y;->F(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p1, :cond_a

    const/4 p1, 0x1

    goto :goto_b

    :cond_a
    const/4 p1, 0x0

    :goto_b
    if-nez v0, :cond_f

    if-eqz p1, :cond_10

    :cond_f
    const/4 v1, 0x1

    .line 81
    :cond_10
    invoke-virtual {p0, v1}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 82
    invoke-virtual {p0, v0}, Landroid/widget/ImageButton;->setClickable(Z)V

    .line 83
    invoke-virtual {p0, v0}, Lcom/google/android/material/internal/CheckableImageButton;->setPressable(Z)V

    .line 84
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setLongClickable(Z)V

    if-eqz v1, :cond_1f

    goto :goto_20

    :cond_1f
    const/4 v2, 0x2

    .line 85
    :goto_20
    invoke-static {p0, v2}, Lb/h/m/y;->h(Landroid/view/View;I)V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/textfield/TextInputLayout;I)V
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->c(I)V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/textfield/TextInputLayout;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->S0:Z

    return p0
.end method

.method public static b(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V
    .registers 2

    .line 52
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 53
    invoke-static {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public static synthetic b(Lcom/google/android/material/textfield/TextInputLayout;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->x:Z

    return p0
.end method

.method public static synthetic c(Lcom/google/android/material/textfield/TextInputLayout;)Lcom/google/android/material/internal/CheckableImageButton;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    return-object p0
.end method

.method private getEndIconDelegate()Lc/a/a/a/p0/e;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->n0:Landroid/util/SparseArray;

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->m0:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/a/a/a/p0/e;

    if-eqz v0, :cond_d

    goto :goto_16

    .line 2
    :cond_d
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->n0:Landroid/util/SparseArray;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/a/a/a/p0/e;

    :goto_16
    return-object v0
.end method

.method private getEndIconToUpdateDummyDrawable()Lcom/google/android/material/internal/CheckableImageButton;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v0

    if-nez v0, :cond_b

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    return-object v0

    .line 3
    :cond_b
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->o()Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->q()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 4
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    return-object v0

    :cond_1a
    const/4 v0, 0x0

    return-object v0
.end method

.method private setEditText(Landroid/widget/EditText;)V
    .registers 5

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-nez v0, :cond_cf

    .line 2
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->m0:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_14

    instance-of v0, p1, Lcom/google/android/material/textfield/TextInputEditText;

    if-nez v0, :cond_14

    const-string v0, "TextInputLayout"

    const-string v1, "EditText added is not a TextInputEditText. Please switch to using that class instead."

    .line 3
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    :cond_14
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    .line 5
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->n:I

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setMinWidth(I)V

    .line 6
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o:I

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setMaxWidth(I)V

    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->x()V

    .line 8
    new-instance v0, Lcom/google/android/material/textfield/TextInputLayout$e;

    invoke-direct {v0, p0}, Lcom/google/android/material/textfield/TextInputLayout$e;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setTextInputAccessibilityDelegate(Lcom/google/android/material/textfield/TextInputLayout$e;)V

    .line 9
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a/a/a/d0/a;->e(Landroid/graphics/Typeface;)V

    .line 10
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getTextSize()F

    move-result v1

    invoke-virtual {v0, v1}, Lc/a/a/a/d0/a;->g(F)V

    .line 11
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getGravity()I

    move-result v0

    .line 12
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    and-int/lit8 v2, v0, -0x71

    or-int/lit8 v2, v2, 0x30

    invoke-virtual {v1, v2}, Lc/a/a/a/d0/a;->b(I)V

    .line 13
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v1, v0}, Lc/a/a/a/d0/a;->e(I)V

    .line 14
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    new-instance v1, Lcom/google/android/material/textfield/TextInputLayout$a;

    invoke-direct {v1, p0}, Lcom/google/android/material/textfield/TextInputLayout$a;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 15
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->B0:Landroid/content/res/ColorStateList;

    if-nez v0, :cond_6b

    .line 16
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getHintTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->B0:Landroid/content/res/ColorStateList;

    .line 17
    :cond_6b
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->H:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_8b

    .line 18
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->I:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_89

    .line 19
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->m:Ljava/lang/CharSequence;

    .line 20
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    .line 21
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 22
    :cond_89
    iput-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->J:Z

    .line 23
    :cond_8b
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    if-eqz v0, :cond_9c

    .line 24
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->b(I)V

    .line 25
    :cond_9c
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->N()V

    .line 26
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0}, Lc/a/a/a/p0/f;->a()V

    .line 27
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->i:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->bringToFront()V

    .line 28
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->j:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->bringToFront()V

    .line 29
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->k:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->bringToFront()V

    .line 30
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->bringToFront()V

    .line 31
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->n()V

    .line 32
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->S()V

    .line 33
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->U()V

    .line 34
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_cb

    .line 35
    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 36
    :cond_cb
    invoke-virtual {p0, v2, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(ZZ)V

    return-void

    .line 37
    :cond_cf
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "We already have an EditText, can only have one"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private setErrorIconVisible(Z)V
    .registers 6

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz p1, :cond_9

    const/4 v3, 0x0

    goto :goto_b

    :cond_9
    const/16 v3, 0x8

    :goto_b
    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->k:Landroid/widget/FrameLayout;

    if-eqz p1, :cond_14

    const/16 v1, 0x8

    :cond_14
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->U()V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->o()Z

    move-result p1

    if-nez p1, :cond_23

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->M()Z

    :cond_23
    return-void
.end method

.method private setHintInternal(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->I:Ljava/lang/CharSequence;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_16

    .line 2
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->I:Ljava/lang/CharSequence;

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->b(Ljava/lang/CharSequence;)V

    .line 4
    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->M0:Z

    if-nez p1, :cond_16

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->y()V

    :cond_16
    return-void
.end method

.method private setPlaceholderTextEnabled(Z)V
    .registers 4

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->x:Z

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    if-eqz p1, :cond_2b

    .line 2
    new-instance v0, Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    .line 3
    sget v1, Lc/a/a/a/f;->textinput_placeholder:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 4
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lb/h/m/y;->g(Landroid/view/View;I)V

    .line 5
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->A:I

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderTextAppearance(I)V

    .line 6
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderTextColor(Landroid/content/res/ColorStateList;)V

    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->a()V

    goto :goto_31

    .line 8
    :cond_2b
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->C()V

    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    .line 10
    :goto_31
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->x:Z

    return-void
.end method


# virtual methods
.method public A()V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->A0:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public B()V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->d0:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->e0:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final C()V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    if-eqz v0, :cond_9

    const/16 v1, 0x8

    .line 2
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_9
    return-void
.end method

.method public final D()V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->G()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    invoke-static {v0, v1}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    :cond_d
    return-void
.end method

.method public final E()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_18

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->o()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->q()Z

    move-result v0

    if-nez v0, :cond_18

    :cond_14
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->F:Ljava/lang/CharSequence;

    if-eqz v0, :cond_22

    :cond_18
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->j:Landroid/widget/LinearLayout;

    .line 3
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v0

    if-lez v0, :cond_22

    const/4 v0, 0x1

    goto :goto_23

    :cond_22
    const/4 v0, 0x0

    :goto_23
    return v0
.end method

.method public final F()Z
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getStartIconDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_a

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->D:Ljava/lang/CharSequence;

    if-eqz v0, :cond_14

    :cond_a
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->i:Landroid/widget/LinearLayout;

    .line 2
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v0

    if-lez v0, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    :goto_15
    return v0
.end method

.method public final G()Z
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz v0, :cond_14

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    if-eqz v1, :cond_14

    .line 2
    invoke-virtual {v0}, Landroid/widget/EditText;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_14

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    :goto_15
    return v0
.end method

.method public final H()V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    if-eqz v0, :cond_18

    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->x:Z

    if-eqz v1, :cond_18

    .line 2
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->w:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 4
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->bringToFront()V

    :cond_18
    return-void
.end method

.method public final I()V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_32

    .line 2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lc/a/a/a/i0/c;->b(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lc/a/a/a/d;->material_font_2_0_box_collapsed_padding_top:I

    .line 4
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->Q:I

    goto :goto_32

    .line 5
    :cond_1c
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_32

    .line 6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lc/a/a/a/d;->material_font_1_3_box_collapsed_padding_top:I

    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->Q:I

    :cond_32
    :goto_32
    return-void
.end method

.method public final J()V
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    if-eqz v0, :cond_15

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    goto :goto_12

    :cond_a
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    :goto_12
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->b(I)V

    :cond_15
    return-void
.end method

.method public final K()V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    if-eqz v0, :cond_2a

    .line 2
    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->s:Z

    if-eqz v1, :cond_b

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->u:I

    goto :goto_d

    :cond_b
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->v:I

    :goto_d
    invoke-virtual {p0, v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Landroid/widget/TextView;I)V

    .line 3
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->s:Z

    if-nez v0, :cond_1d

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->B:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_1d

    .line 4
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 5
    :cond_1d
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->s:Z

    if-eqz v0, :cond_2a

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->C:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_2a

    .line 6
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_2a
    return-void
.end method

.method public final L()V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->m()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->M0:Z

    if-nez v0, :cond_16

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->O:I

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->R:I

    if-eq v0, v1, :cond_16

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->l()V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->y()V

    :cond_16
    return-void
.end method

.method public final M()Z
    .registers 11

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 2
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->F()Z

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v0, :cond_49

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->i:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v0

    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getPaddingLeft()I

    move-result v6

    sub-int/2addr v0, v6

    .line 4
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->i0:Landroid/graphics/drawable/Drawable;

    if-eqz v6, :cond_25

    iget v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->j0:I

    if-eq v6, v0, :cond_31

    .line 5
    :cond_25
    new-instance v6, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v6}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    iput-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->i0:Landroid/graphics/drawable/Drawable;

    .line 6
    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->j0:I

    .line 7
    invoke-virtual {v6, v1, v1, v0, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 8
    :cond_31
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-static {v0}, Lb/h/n/i;->a(Landroid/widget/TextView;)[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 9
    aget-object v6, v0, v1

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->i0:Landroid/graphics/drawable/Drawable;

    if-eq v6, v7, :cond_62

    .line 10
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    aget-object v8, v0, v5

    aget-object v9, v0, v4

    aget-object v0, v0, v3

    invoke-static {v6, v7, v8, v9, v0}, Lb/h/n/i;->a(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_60

    .line 11
    :cond_49
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->i0:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_62

    .line 12
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-static {v0}, Lb/h/n/i;->a(Landroid/widget/TextView;)[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 13
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    aget-object v7, v0, v5

    aget-object v8, v0, v4

    aget-object v0, v0, v3

    invoke-static {v6, v2, v7, v8, v0}, Lb/h/n/i;->a(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 14
    iput-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->i0:Landroid/graphics/drawable/Drawable;

    :goto_60
    const/4 v0, 0x1

    goto :goto_63

    :cond_62
    const/4 v0, 0x0

    .line 15
    :goto_63
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->E()Z

    move-result v6

    if-eqz v6, :cond_d5

    .line 16
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->G:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v2

    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getPaddingRight()I

    move-result v6

    sub-int/2addr v2, v6

    .line 17
    invoke-direct {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getEndIconToUpdateDummyDrawable()Lcom/google/android/material/internal/CheckableImageButton;

    move-result-object v6

    if-eqz v6, :cond_8c

    .line 18
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v2, v7

    .line 19
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 20
    invoke-static {v6}, Lb/h/m/h;->b(Landroid/view/ViewGroup$MarginLayoutParams;)I

    move-result v6

    add-int/2addr v2, v6

    .line 21
    :cond_8c
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-static {v6}, Lb/h/n/i;->a(Landroid/widget/TextView;)[Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 22
    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->u0:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_ad

    iget v8, p0, Lcom/google/android/material/textfield/TextInputLayout;->v0:I

    if-eq v8, v2, :cond_ad

    .line 23
    iput v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->v0:I

    .line 24
    invoke-virtual {v7, v1, v1, v2, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 25
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    aget-object v1, v6, v1

    aget-object v2, v6, v5

    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->u0:Landroid/graphics/drawable/Drawable;

    aget-object v3, v6, v3

    invoke-static {v0, v1, v2, v4, v3}, Lb/h/n/i;->a(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_f6

    .line 26
    :cond_ad
    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->u0:Landroid/graphics/drawable/Drawable;

    if-nez v7, :cond_bd

    .line 27
    new-instance v7, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v7}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    iput-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->u0:Landroid/graphics/drawable/Drawable;

    .line 28
    iput v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->v0:I

    .line 29
    invoke-virtual {v7, v1, v1, v2, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 30
    :cond_bd
    aget-object v2, v6, v4

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->u0:Landroid/graphics/drawable/Drawable;

    if-eq v2, v7, :cond_d3

    .line 31
    aget-object v0, v6, v4

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->w0:Landroid/graphics/drawable/Drawable;

    .line 32
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    aget-object v1, v6, v1

    aget-object v2, v6, v5

    aget-object v3, v6, v3

    invoke-static {v0, v1, v2, v7, v3}, Lb/h/n/i;->a(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_f6

    :cond_d3
    move v5, v0

    goto :goto_f6

    .line 33
    :cond_d5
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->u0:Landroid/graphics/drawable/Drawable;

    if-eqz v6, :cond_f7

    .line 34
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-static {v6}, Lb/h/n/i;->a(Landroid/widget/TextView;)[Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 35
    aget-object v4, v6, v4

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->u0:Landroid/graphics/drawable/Drawable;

    if-ne v4, v7, :cond_f3

    .line 36
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    aget-object v1, v6, v1

    aget-object v4, v6, v5

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->w0:Landroid/graphics/drawable/Drawable;

    aget-object v3, v6, v3

    invoke-static {v0, v1, v4, v7, v3}, Lb/h/n/i;->a(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_f4

    :cond_f3
    move v5, v0

    .line 37
    :goto_f4
    iput-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->u0:Landroid/graphics/drawable/Drawable;

    :goto_f6
    move v0, v5

    :cond_f7
    return v0
.end method

.method public N()V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz v0, :cond_50

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    if-eqz v1, :cond_9

    goto :goto_50

    .line 2
    :cond_9
    invoke-virtual {v0}, Landroid/widget/EditText;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_10

    return-void

    .line 3
    :cond_10
    invoke-static {v0}, Lb/b/q/q;->a(Landroid/graphics/drawable/Drawable;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 4
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 5
    :cond_1a
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v1}, Lc/a/a/a/p0/f;->d()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 6
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    .line 7
    invoke-virtual {v1}, Lc/a/a/a/p0/f;->g()I

    move-result v1

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 8
    invoke-static {v1, v2}, Lb/b/q/f;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_50

    .line 10
    :cond_32
    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->s:Z

    if-eqz v1, :cond_48

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    if-eqz v1, :cond_48

    .line 11
    invoke-virtual {v1}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v1

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 12
    invoke-static {v1, v2}, Lb/b/q/f;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_50

    .line 14
    :cond_48
    invoke-static {v0}, Lb/h/f/l/a;->b(Landroid/graphics/drawable/Drawable;)V

    .line 15
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->refreshDrawableState()V

    :cond_50
    :goto_50
    return-void
.end method

.method public final O()Z
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 2
    :cond_6
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->j:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v0

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->i:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 3
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getMeasuredHeight()I

    move-result v2

    if-ge v2, v0, :cond_25

    .line 4
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setMinimumHeight(I)V

    const/4 v0, 0x1

    return v0

    :cond_25
    return v1
.end method

.method public final P()V
    .registers 4

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1c

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->h:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->i()I

    move-result v1

    .line 4
    iget v2, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    if-eq v1, v2, :cond_1c

    .line 5
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 6
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->h:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->requestLayout()V

    :cond_1c
    return-void
.end method

.method public final Q()V
    .registers 6

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz v0, :cond_2e

    .line 2
    invoke-virtual {v0}, Landroid/widget/EditText;->getGravity()I

    move-result v0

    .line 3
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 4
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    .line 5
    invoke-virtual {v1}, Landroid/widget/EditText;->getCompoundPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    .line 6
    invoke-virtual {v2}, Landroid/widget/EditText;->getCompoundPaddingTop()I

    move-result v2

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    .line 7
    invoke-virtual {v3}, Landroid/widget/EditText;->getCompoundPaddingRight()I

    move-result v3

    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    .line 8
    invoke-virtual {v4}, Landroid/widget/EditText;->getCompoundPaddingBottom()I

    move-result v4

    .line 9
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    :cond_2e
    return-void
.end method

.method public final R()V
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    goto :goto_e

    :cond_6
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    :goto_e
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->c(I)V

    return-void
.end method

.method public final S()V
    .registers 6

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->w()Z

    move-result v0

    if-eqz v0, :cond_d

    const/4 v0, 0x0

    goto :goto_13

    :cond_d
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-static {v0}, Lb/h/m/y;->x(Landroid/view/View;)I

    move-result v0

    .line 3
    :goto_13
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->E:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    .line 4
    invoke-virtual {v2}, Landroid/widget/EditText;->getCompoundPaddingTop()I

    move-result v2

    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    .line 6
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lc/a/a/a/d;->material_input_text_to_prefix_suffix_padding:I

    .line 7
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    .line 8
    invoke-virtual {v4}, Landroid/widget/EditText;->getCompoundPaddingBottom()I

    move-result v4

    .line 9
    invoke-static {v1, v0, v2, v3, v4}, Lb/h/m/y;->a(Landroid/view/View;IIII)V

    return-void
.end method

.method public final T()V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->E:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->D:Ljava/lang/CharSequence;

    if-eqz v1, :cond_e

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->t()Z

    move-result v1

    if-nez v1, :cond_e

    const/4 v1, 0x0

    goto :goto_10

    :cond_e
    const/16 v1, 0x8

    :goto_10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->M()Z

    return-void
.end method

.method public final U()V
    .registers 6

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->q()Z

    move-result v0

    if-nez v0, :cond_19

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->r()Z

    move-result v0

    if-eqz v0, :cond_12

    goto :goto_19

    :cond_12
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-static {v0}, Lb/h/m/y;->w(Landroid/view/View;)I

    move-result v0

    goto :goto_1a

    :cond_19
    :goto_19
    const/4 v0, 0x0

    .line 3
    :goto_1a
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->G:Landroid/widget/TextView;

    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 5
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lc/a/a/a/d;->material_input_text_to_prefix_suffix_padding:I

    .line 6
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    .line 7
    invoke-virtual {v3}, Landroid/widget/EditText;->getPaddingTop()I

    move-result v3

    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    .line 8
    invoke-virtual {v4}, Landroid/widget/EditText;->getPaddingBottom()I

    move-result v4

    .line 9
    invoke-static {v1, v2, v3, v0, v4}, Lb/h/m/y;->a(Landroid/view/View;IIII)V

    return-void
.end method

.method public final V()V
    .registers 5

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->G:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    .line 2
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->F:Ljava/lang/CharSequence;

    const/4 v2, 0x0

    if-eqz v1, :cond_13

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->t()Z

    move-result v1

    if-nez v1, :cond_13

    const/4 v1, 0x1

    goto :goto_14

    :cond_13
    const/4 v1, 0x0

    .line 3
    :goto_14
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->G:Landroid/widget/TextView;

    if-eqz v1, :cond_19

    goto :goto_1b

    :cond_19
    const/16 v2, 0x8

    :goto_1b
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 4
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->G:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getVisibility()I

    move-result v2

    if-eq v0, v2, :cond_2d

    .line 5
    invoke-direct {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getEndIconDelegate()Lc/a/a/a/p0/e;

    move-result-object v0

    invoke-virtual {v0, v1}, Lc/a/a/a/p0/e;->a(Z)V

    .line 6
    :cond_2d
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->M()Z

    return-void
.end method

.method public W()V
    .registers 7

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    if-eqz v0, :cond_f6

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    if-nez v0, :cond_a

    goto/16 :goto_f6

    .line 2
    :cond_a
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isFocused()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_1f

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz v0, :cond_1d

    invoke-virtual {v0}, Landroid/widget/EditText;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_1d

    goto :goto_1f

    :cond_1d
    const/4 v0, 0x0

    goto :goto_20

    :cond_1f
    :goto_1f
    const/4 v0, 0x1

    .line 3
    :goto_20
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isHovered()Z

    move-result v3

    if-nez v3, :cond_33

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz v3, :cond_31

    invoke-virtual {v3}, Landroid/widget/EditText;->isHovered()Z

    move-result v3

    if-eqz v3, :cond_31

    goto :goto_33

    :cond_31
    const/4 v3, 0x0

    goto :goto_34

    :cond_33
    :goto_33
    const/4 v3, 0x1

    .line 4
    :goto_34
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    move-result v4

    if-nez v4, :cond_3f

    .line 5
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->L0:I

    iput v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->U:I

    goto :goto_81

    .line 6
    :cond_3f
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v4}, Lc/a/a/a/p0/f;->d()Z

    move-result v4

    if-eqz v4, :cond_58

    .line 7
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->G0:Landroid/content/res/ColorStateList;

    if-eqz v4, :cond_4f

    .line 8
    invoke-virtual {p0, v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->b(ZZ)V

    goto :goto_81

    .line 9
    :cond_4f
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v4}, Lc/a/a/a/p0/f;->g()I

    move-result v4

    iput v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->U:I

    goto :goto_81

    .line 10
    :cond_58
    iget-boolean v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->s:Z

    if-eqz v4, :cond_6f

    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    if-eqz v4, :cond_6f

    .line 11
    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->G0:Landroid/content/res/ColorStateList;

    if-eqz v5, :cond_68

    .line 12
    invoke-virtual {p0, v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->b(ZZ)V

    goto :goto_81

    .line 13
    :cond_68
    invoke-virtual {v4}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v4

    iput v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->U:I

    goto :goto_81

    :cond_6f
    if-eqz v0, :cond_76

    .line 14
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->F0:I

    iput v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->U:I

    goto :goto_81

    :cond_76
    if-eqz v3, :cond_7d

    .line 15
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->E0:I

    iput v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->U:I

    goto :goto_81

    .line 16
    :cond_7d
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->D0:I

    iput v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->U:I

    .line 17
    :goto_81
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getErrorIconDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_98

    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    .line 18
    invoke-virtual {v4}, Lc/a/a/a/p0/f;->m()Z

    move-result v4

    if-eqz v4, :cond_98

    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    .line 19
    invoke-virtual {v4}, Lc/a/a/a/p0/f;->d()Z

    move-result v4

    if-eqz v4, :cond_98

    const/4 v1, 0x1

    .line 20
    :cond_98
    invoke-direct {p0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorIconVisible(Z)V

    .line 21
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->A()V

    .line 22
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->B()V

    .line 23
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->z()V

    .line 24
    invoke-direct {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getEndIconDelegate()Lc/a/a/a/p0/e;

    move-result-object v1

    invoke-virtual {v1}, Lc/a/a/a/p0/e;->b()Z

    move-result v1

    if-eqz v1, :cond_b7

    .line 25
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v1}, Lc/a/a/a/p0/f;->d()Z

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->c(Z)V

    :cond_b7
    if-eqz v0, :cond_c4

    .line 26
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_c4

    .line 27
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->T:I

    iput v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->R:I

    goto :goto_c8

    .line 28
    :cond_c4
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->S:I

    iput v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->R:I

    .line 29
    :goto_c8
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    const/4 v4, 0x2

    if-ne v1, v4, :cond_d0

    .line 30
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->L()V

    .line 31
    :cond_d0
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    if-ne v1, v2, :cond_f3

    .line 32
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_df

    .line 33
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->I0:I

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->V:I

    goto :goto_f3

    :cond_df
    if-eqz v3, :cond_e8

    if-nez v0, :cond_e8

    .line 34
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->K0:I

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->V:I

    goto :goto_f3

    :cond_e8
    if-eqz v0, :cond_ef

    .line 35
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->J0:I

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->V:I

    goto :goto_f3

    .line 36
    :cond_ef
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->H0:I

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->V:I

    .line 37
    :cond_f3
    :goto_f3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->c()V

    :cond_f6
    :goto_f6
    return-void
.end method

.method public final a(IZ)I
    .registers 4

    .line 57
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundPaddingLeft()I

    move-result v0

    add-int/2addr p1, v0

    .line 58
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->D:Ljava/lang/CharSequence;

    if-eqz v0, :cond_1b

    if-nez p2, :cond_1b

    .line 59
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->E:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result p2

    sub-int/2addr p1, p2

    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->E:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result p2

    add-int/2addr p1, p2

    :cond_1b
    return p1
.end method

.method public final a(Landroid/graphics/Rect;F)I
    .registers 4

    .line 60
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->v()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 61
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result p1

    int-to-float p1, p1

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p2, v0

    sub-float/2addr p1, p2

    float-to-int p1, p1

    return p1

    .line 62
    :cond_11
    iget p1, p1, Landroid/graphics/Rect;->top:I

    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getCompoundPaddingTop()I

    move-result p2

    add-int/2addr p1, p2

    return p1
.end method

.method public final a(Landroid/graphics/Rect;Landroid/graphics/Rect;F)I
    .registers 5

    .line 63
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->v()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 64
    iget p1, p2, Landroid/graphics/Rect;->top:I

    int-to-float p1, p1

    add-float/2addr p1, p3

    float-to-int p1, p1

    return p1

    .line 65
    :cond_c
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getCompoundPaddingBottom()I

    move-result p2

    sub-int/2addr p1, p2

    return p1
.end method

.method public final a(Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .registers 6

    .line 42
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz v0, :cond_6a

    .line 43
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->a0:Landroid/graphics/Rect;

    .line 44
    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_f

    const/4 v1, 0x1

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    .line 45
    :goto_10
    iget v3, p1, Landroid/graphics/Rect;->bottom:I

    iput v3, v0, Landroid/graphics/Rect;->bottom:I

    .line 46
    iget v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    if-eq v3, v2, :cond_52

    const/4 v2, 0x2

    if-eq v3, v2, :cond_32

    .line 47
    iget v2, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0, v2, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(IZ)I

    move-result v2

    iput v2, v0, Landroid/graphics/Rect;->left:I

    .line 48
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    move-result v2

    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 49
    iget p1, p1, Landroid/graphics/Rect;->right:I

    invoke-virtual {p0, p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->b(IZ)I

    move-result p1

    iput p1, v0, Landroid/graphics/Rect;->right:I

    return-object v0

    .line 50
    :cond_32
    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getPaddingLeft()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 51
    iget v1, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->i()I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 52
    iget p1, p1, Landroid/graphics/Rect;->right:I

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getPaddingRight()I

    move-result v1

    sub-int/2addr p1, v1

    iput p1, v0, Landroid/graphics/Rect;->right:I

    return-object v0

    .line 53
    :cond_52
    iget v2, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0, v2, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(IZ)I

    move-result v2

    iput v2, v0, Landroid/graphics/Rect;->left:I

    .line 54
    iget v2, p1, Landroid/graphics/Rect;->top:I

    iget v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->Q:I

    add-int/2addr v2, v3

    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 55
    iget p1, p1, Landroid/graphics/Rect;->right:I

    invoke-virtual {p0, p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->b(IZ)I

    move-result p1

    iput p1, v0, Landroid/graphics/Rect;->right:I

    return-object v0

    .line 56
    :cond_6a
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1
.end method

.method public final a()V
    .registers 3

    .line 29
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    if-eqz v0, :cond_f

    .line 30
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->h:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 31
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_f
    return-void
.end method

.method public a(F)V
    .registers 6

    .line 114
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->p()F

    move-result v0

    cmpl-float v0, v0, p1

    if-nez v0, :cond_b

    return-void

    .line 115
    :cond_b
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->Q0:Landroid/animation/ValueAnimator;

    if-nez v0, :cond_2c

    .line 116
    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->Q0:Landroid/animation/ValueAnimator;

    .line 117
    sget-object v1, Lc/a/a/a/m/a;->b:Landroid/animation/TimeInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 118
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->Q0:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0xa7

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 119
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->Q0:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/google/android/material/textfield/TextInputLayout$d;

    invoke-direct {v1, p0}, Lcom/google/android/material/textfield/TextInputLayout$d;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 120
    :cond_2c
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->Q0:Landroid/animation/ValueAnimator;

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v3}, Lc/a/a/a/d0/a;->p()F

    move-result v3

    aput v3, v1, v2

    const/4 v2, 0x1

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 121
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->Q0:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public final a(I)V
    .registers 4

    .line 70
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p0:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/textfield/TextInputLayout$g;

    .line 71
    invoke-interface {v1, p0, p1}, Lcom/google/android/material/textfield/TextInputLayout$g;->a(Lcom/google/android/material/textfield/TextInputLayout;I)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final a(Landroid/graphics/Canvas;)V
    .registers 5

    .line 86
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->L:Lc/a/a/a/l0/h;

    if-eqz v0, :cond_14

    .line 87
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 88
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    iget v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->R:I

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 89
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->L:Lc/a/a/a/l0/h;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->draw(Landroid/graphics/Canvas;)V

    :cond_14
    return-void
.end method

.method public final a(Landroid/graphics/RectF;)V
    .registers 5

    .line 101
    iget v0, p1, Landroid/graphics/RectF;->left:F

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->N:I

    int-to-float v2, v1

    sub-float/2addr v0, v2

    iput v0, p1, Landroid/graphics/RectF;->left:F

    .line 102
    iget v0, p1, Landroid/graphics/RectF;->right:F

    int-to-float v1, v1

    add-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/RectF;->right:F

    return-void
.end method

.method public a(Landroid/widget/TextView;I)V
    .registers 5

    const/4 v0, 0x1

    .line 37
    :try_start_1
    invoke-static {p1, p2}, Lb/h/n/i;->d(Landroid/widget/TextView;I)V

    .line 38
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt p2, v1, :cond_18

    .line 39
    invoke-virtual {p1}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p2
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_12} :catch_1b

    const v1, -0xff01

    if-ne p2, v1, :cond_18

    goto :goto_1c

    :cond_18
    const/4 p2, 0x0

    const/4 v0, 0x0

    goto :goto_1c

    :catch_1b
    nop

    :goto_1c
    if-eqz v0, :cond_30

    .line 40
    sget p2, Lc/a/a/a/k;->TextAppearance_AppCompat_Caption:I

    invoke-static {p1, p2}, Lb/h/n/i;->d(Landroid/widget/TextView;I)V

    .line 41
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    sget v0, Lc/a/a/a/c;->design_error:I

    invoke-static {p2, v0}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_30
    return-void
.end method

.method public final a(Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V
    .registers 6

    .line 103
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 104
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_31

    if-eqz p2, :cond_31

    invoke-virtual {p2}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v1

    if-nez v1, :cond_13

    goto :goto_31

    .line 105
    :cond_13
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/internal/CheckableImageButton;)[I

    move-result-object v1

    invoke-virtual {p2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v2

    invoke-virtual {p2, v1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p2

    .line 106
    invoke-static {v0}, Lb/h/f/l/a;->i(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 107
    invoke-static {p2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    invoke-static {v0, p2}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 108
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_31
    :goto_31
    return-void
.end method

.method public final a(Lcom/google/android/material/internal/CheckableImageButton;ZLandroid/content/res/ColorStateList;ZLandroid/graphics/PorterDuff$Mode;)V
    .registers 7

    .line 72
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_1c

    if-nez p2, :cond_a

    if-eqz p4, :cond_1c

    .line 73
    :cond_a
    invoke-static {v0}, Lb/h/f/l/a;->i(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz p2, :cond_17

    .line 74
    invoke-static {v0, p3}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    :cond_17
    if-eqz p4, :cond_1c

    .line 75
    invoke-static {v0, p5}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 76
    :cond_1c
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eq p2, v0, :cond_25

    .line 77
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_25
    return-void
.end method

.method public a(Lcom/google/android/material/textfield/TextInputLayout$f;)V
    .registers 3

    .line 67
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l0:Ljava/util/LinkedHashSet;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 68
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz v0, :cond_c

    .line 69
    invoke-interface {p1, p0}, Lcom/google/android/material/textfield/TextInputLayout$f;->a(Lcom/google/android/material/textfield/TextInputLayout;)V

    :cond_c
    return-void
.end method

.method public a(Lcom/google/android/material/textfield/TextInputLayout$g;)V
    .registers 3

    .line 66
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p0:Ljava/util/LinkedHashSet;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Z)V
    .registers 3

    .line 90
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->Q0:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 91
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->Q0:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_f
    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p1, :cond_1b

    .line 92
    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->P0:Z

    if-eqz p1, :cond_1b

    .line 93
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->a(F)V

    goto :goto_20

    .line 94
    :cond_1b
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {p1, v0}, Lc/a/a/a/d0/a;->h(F)V

    :goto_20
    const/4 p1, 0x0

    .line 95
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->M0:Z

    .line 96
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->m()Z

    move-result p1

    if-eqz p1, :cond_2c

    .line 97
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->y()V

    .line 98
    :cond_2c
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->R()V

    .line 99
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->T()V

    .line 100
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->V()V

    return-void
.end method

.method public final a(ZZ)V
    .registers 11

    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    move-result v0

    .line 4
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_16

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_16

    const/4 v1, 0x1

    goto :goto_17

    :cond_16
    const/4 v1, 0x0

    .line 5
    :goto_17
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz v4, :cond_23

    invoke-virtual {v4}, Landroid/widget/EditText;->hasFocus()Z

    move-result v4

    if-eqz v4, :cond_23

    const/4 v4, 0x1

    goto :goto_24

    :cond_23
    const/4 v4, 0x0

    .line 6
    :goto_24
    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v5}, Lc/a/a/a/p0/f;->d()Z

    move-result v5

    .line 7
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->B0:Landroid/content/res/ColorStateList;

    if-eqz v6, :cond_3a

    .line 8
    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v7, v6}, Lc/a/a/a/d0/a;->b(Landroid/content/res/ColorStateList;)V

    .line 9
    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->B0:Landroid/content/res/ColorStateList;

    invoke-virtual {v6, v7}, Lc/a/a/a/d0/a;->c(Landroid/content/res/ColorStateList;)V

    :cond_3a
    if-nez v0, :cond_63

    .line 10
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->B0:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_4e

    new-array v2, v2, [I

    const v5, -0x101009e

    aput v5, v2, v3

    iget v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->L0:I

    .line 11
    invoke-virtual {v0, v2, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    goto :goto_50

    :cond_4e
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->L0:I

    .line 12
    :goto_50
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v2, v3}, Lc/a/a/a/d0/a;->b(Landroid/content/res/ColorStateList;)V

    .line 13
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v2, v0}, Lc/a/a/a/d0/a;->c(Landroid/content/res/ColorStateList;)V

    goto :goto_8e

    :cond_63
    if-eqz v5, :cond_71

    .line 14
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v2}, Lc/a/a/a/p0/f;->h()Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v0, v2}, Lc/a/a/a/d0/a;->b(Landroid/content/res/ColorStateList;)V

    goto :goto_8e

    .line 15
    :cond_71
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->s:Z

    if-eqz v0, :cond_83

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    if-eqz v0, :cond_83

    .line 16
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v2, v0}, Lc/a/a/a/d0/a;->b(Landroid/content/res/ColorStateList;)V

    goto :goto_8e

    :cond_83
    if-eqz v4, :cond_8e

    .line 17
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->C0:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_8e

    .line 18
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v2, v0}, Lc/a/a/a/d0/a;->b(Landroid/content/res/ColorStateList;)V

    :cond_8e
    :goto_8e
    if-nez v1, :cond_a7

    .line 19
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->O0:Z

    if-eqz v0, :cond_a7

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_9d

    if-eqz v4, :cond_9d

    goto :goto_a7

    :cond_9d
    if-nez p2, :cond_a3

    .line 20
    iget-boolean p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->M0:Z

    if-nez p2, :cond_b0

    .line 21
    :cond_a3
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->b(Z)V

    goto :goto_b0

    :cond_a7
    :goto_a7
    if-nez p2, :cond_ad

    .line 22
    iget-boolean p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->M0:Z

    if-eqz p2, :cond_b0

    .line 23
    :cond_ad
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Z)V

    :cond_b0
    :goto_b0
    return-void
.end method

.method public final a(Lcom/google/android/material/internal/CheckableImageButton;)[I
    .registers 6

    .line 109
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getDrawableState()[I

    move-result-object v0

    .line 110
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getDrawableState()[I

    move-result-object p1

    .line 111
    array-length v1, v0

    .line 112
    array-length v2, v0

    array-length v3, p1

    add-int/2addr v2, v3

    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    .line 113
    array-length v2, p1

    const/4 v3, 0x0

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 5

    .line 1
    instance-of v0, p1, Landroid/widget/EditText;

    if-eqz v0, :cond_24

    .line 2
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p2, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 3
    iget v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    and-int/lit8 v0, v0, -0x71

    or-int/lit8 v0, v0, 0x10

    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 4
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->h:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 5
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->h:Landroid/widget/FrameLayout;

    invoke-virtual {p2, p3}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 6
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->P()V

    .line 7
    check-cast p1, Landroid/widget/EditText;

    invoke-direct {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setEditText(Landroid/widget/EditText;)V

    goto :goto_27

    .line 8
    :cond_24
    invoke-super {p0, p1, p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :goto_27
    return-void
.end method

.method public final b(IZ)I
    .registers 4

    .line 41
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundPaddingRight()I

    move-result v0

    sub-int/2addr p1, v0

    .line 42
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->D:Ljava/lang/CharSequence;

    if-eqz v0, :cond_1b

    if-eqz p2, :cond_1b

    .line 43
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->E:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result p2

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->E:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v0

    sub-int/2addr p2, v0

    add-int/2addr p1, p2

    :cond_1b
    return p1
.end method

.method public final b(Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .registers 6

    .line 44
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz v0, :cond_2f

    .line 45
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->a0:Landroid/graphics/Rect;

    .line 46
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v1}, Lc/a/a/a/d0/a;->n()F

    move-result v1

    .line 47
    iget v2, p1, Landroid/graphics/Rect;->left:I

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getCompoundPaddingLeft()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, v0, Landroid/graphics/Rect;->left:I

    .line 48
    invoke-virtual {p0, p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Landroid/graphics/Rect;F)I

    move-result v2

    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 49
    iget v2, p1, Landroid/graphics/Rect;->right:I

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getCompoundPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, v0, Landroid/graphics/Rect;->right:I

    .line 50
    invoke-virtual {p0, p1, v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Landroid/graphics/Rect;Landroid/graphics/Rect;F)I

    move-result p1

    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    return-object v0

    .line 51
    :cond_2f
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1
.end method

.method public final b()V
    .registers 7

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz v0, :cond_65

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_a

    goto :goto_65

    .line 3
    :cond_a
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lc/a/a/a/i0/c;->b(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 4
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    .line 5
    invoke-static {v0}, Lb/h/m/y;->x(Landroid/view/View;)I

    move-result v1

    .line 6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lc/a/a/a/d;->material_filled_edittext_font_2_0_padding_top:I

    .line 7
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    .line 8
    invoke-static {v3}, Lb/h/m/y;->w(Landroid/view/View;)I

    move-result v3

    .line 9
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lc/a/a/a/d;->material_filled_edittext_font_2_0_padding_bottom:I

    .line 10
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 11
    invoke-static {v0, v1, v2, v3, v4}, Lb/h/m/y;->a(Landroid/view/View;IIII)V

    goto :goto_65

    .line 12
    :cond_38
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_65

    .line 13
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    .line 14
    invoke-static {v0}, Lb/h/m/y;->x(Landroid/view/View;)I

    move-result v1

    .line 15
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lc/a/a/a/d;->material_filled_edittext_font_1_3_padding_top:I

    .line 16
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    .line 17
    invoke-static {v3}, Lb/h/m/y;->w(Landroid/view/View;)I

    move-result v3

    .line 18
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lc/a/a/a/d;->material_filled_edittext_font_1_3_padding_bottom:I

    .line 19
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 20
    invoke-static {v0, v1, v2, v3, v4}, Lb/h/m/y;->a(Landroid/view/View;IIII)V

    :cond_65
    :goto_65
    return-void
.end method

.method public b(I)V
    .registers 10

    .line 21
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->s:Z

    .line 22
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->r:I

    const/4 v2, 0x0

    const/4 v3, -0x1

    if-ne v1, v3, :cond_1a

    .line 23
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 25
    iput-boolean v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->s:Z

    goto :goto_5e

    :cond_1a
    const/4 v3, 0x1

    if-le p1, v1, :cond_1f

    const/4 v1, 0x1

    goto :goto_20

    :cond_1f
    const/4 v1, 0x0

    .line 26
    :goto_20
    iput-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->s:Z

    .line 27
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    iget v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->r:I

    iget-boolean v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->s:Z

    .line 28
    invoke-static {v1, v4, p1, v5, v6}, Lcom/google/android/material/textfield/TextInputLayout;->a(Landroid/content/Context;Landroid/widget/TextView;IIZ)V

    .line 29
    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->s:Z

    if-eq v0, v1, :cond_36

    .line 30
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->K()V

    .line 31
    :cond_36
    invoke-static {}, Lb/h/k/a;->b()Lb/h/k/a;

    move-result-object v1

    .line 32
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    .line 33
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lc/a/a/a/j;->character_counter_pattern:I

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    .line 34
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v7, v2

    iget p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->r:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v7, v3

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 35
    invoke-virtual {v1, p1}, Lb/h/k/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 36
    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    :goto_5e
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz p1, :cond_6f

    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->s:Z

    if-eq v0, p1, :cond_6f

    .line 38
    invoke-virtual {p0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->d(Z)V

    .line 39
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->W()V

    .line 40
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->N()V

    :cond_6f
    return-void
.end method

.method public final b(Landroid/graphics/Canvas;)V
    .registers 3

    .line 54
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->H:Z

    if-eqz v0, :cond_9

    .line 55
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->a(Landroid/graphics/Canvas;)V

    :cond_9
    return-void
.end method

.method public final b(Z)V
    .registers 3

    .line 64
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->Q0:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 65
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->Q0:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_f
    const/4 v0, 0x0

    if-eqz p1, :cond_1a

    .line 66
    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->P0:Z

    if-eqz p1, :cond_1a

    .line 67
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->a(F)V

    goto :goto_1f

    .line 68
    :cond_1a
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {p1, v0}, Lc/a/a/a/d0/a;->h(F)V

    .line 69
    :goto_1f
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->m()Z

    move-result p1

    if-eqz p1, :cond_32

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    check-cast p1, Lc/a/a/a/p0/c;

    invoke-virtual {p1}, Lc/a/a/a/p0/c;->F()Z

    move-result p1

    if-eqz p1, :cond_32

    .line 70
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->l()V

    :cond_32
    const/4 p1, 0x1

    .line 71
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->M0:Z

    .line 72
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->p()V

    .line 73
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->T()V

    .line 74
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->V()V

    return-void
.end method

.method public final b(ZZ)V
    .registers 7

    .line 56
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->G0:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    .line 57
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->G0:Landroid/content/res/ColorStateList;

    const/4 v2, 0x2

    new-array v3, v2, [I

    fill-array-data v3, :array_2a

    .line 58
    invoke-virtual {v1, v3, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    .line 59
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->G0:Landroid/content/res/ColorStateList;

    new-array v2, v2, [I

    fill-array-data v2, :array_32

    .line 60
    invoke-virtual {v3, v2, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    if-eqz p1, :cond_22

    .line 61
    iput v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->U:I

    goto :goto_29

    :cond_22
    if-eqz p2, :cond_27

    .line 62
    iput v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->U:I

    goto :goto_29

    .line 63
    :cond_27
    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->U:I

    :goto_29
    return-void

    :array_2a
    .array-data 4
        0x1010367
        0x101009e
    .end array-data

    :array_32
    .array-data 4
        0x10102fe
        0x101009e
    .end array-data
.end method

.method public final c()V
    .registers 4

    .line 5
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    if-nez v0, :cond_5

    return-void

    .line 6
    :cond_5
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->M:Lc/a/a/a/l0/m;

    invoke-virtual {v0, v1}, Lc/a/a/a/l0/h;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->j()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 8
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->R:I

    int-to-float v1, v1

    iget v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->U:I

    invoke-virtual {v0, v1, v2}, Lc/a/a/a/l0/h;->a(FI)V

    .line 9
    :cond_1a
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->h()I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->V:I

    .line 10
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v1, v0}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    .line 11
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->m0:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_37

    .line 12
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 13
    :cond_37
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->d()V

    .line 14
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->invalidate()V

    return-void
.end method

.method public final c(I)V
    .registers 2

    if-nez p1, :cond_a

    .line 2
    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->M0:Z

    if-nez p1, :cond_a

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->H()V

    goto :goto_d

    .line 4
    :cond_a
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->p()V

    :goto_d
    return-void
.end method

.method public final c(Landroid/graphics/Rect;)V
    .registers 6

    .line 22
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->L:Lc/a/a/a/l0/h;

    if-eqz v0, :cond_11

    .line 23
    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    iget v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->T:I

    sub-int v2, v1, v2

    .line 24
    iget v3, p1, Landroid/graphics/Rect;->left:I

    iget p1, p1, Landroid/graphics/Rect;->right:I

    invoke-virtual {v0, v3, v2, p1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_11
    return-void
.end method

.method public final c(Z)V
    .registers 3

    if-eqz p1, :cond_23

    .line 15
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getEndIconDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_23

    .line 16
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getEndIconDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-static {p1}, Lb/h/f/l/a;->i(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 17
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    .line 18
    invoke-virtual {v0}, Lc/a/a/a/p0/f;->g()I

    move-result v0

    .line 19
    invoke-static {p1, v0}, Lb/h/f/l/a;->b(Landroid/graphics/drawable/Drawable;I)V

    .line 20
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_26

    .line 21
    :cond_23
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->e()V

    :goto_26
    return-void
.end method

.method public final d()V
    .registers 3

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->L:Lc/a/a/a/l0/h;

    if-nez v0, :cond_5

    return-void

    .line 3
    :cond_5
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->k()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 4
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->L:Lc/a/a/a/l0/h;

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->U:I

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    .line 5
    :cond_16
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->invalidate()V

    return-void
.end method

.method public d(Z)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->a(ZZ)V

    return-void
.end method

.method public dispatchProvideAutofillStructure(Landroid/view/ViewStructure;I)V
    .registers 7
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1a
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-nez v0, :cond_8

    .line 2
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->dispatchProvideAutofillStructure(Landroid/view/ViewStructure;I)V

    return-void

    .line 3
    :cond_8
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->m:Ljava/lang/CharSequence;

    const/4 v2, 0x0

    if-eqz v1, :cond_30

    .line 4
    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->J:Z

    .line 5
    iput-boolean v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->J:Z

    .line 6
    invoke-virtual {v0}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    move-result-object v0

    .line 7
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->m:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 8
    :try_start_1c
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->dispatchProvideAutofillStructure(Landroid/view/ViewStructure;I)V
    :try_end_1f
    .catchall {:try_start_1c .. :try_end_1f} :catchall_27

    .line 9
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 10
    iput-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->J:Z

    goto :goto_69

    :catchall_27
    move-exception p1

    .line 11
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 12
    iput-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->J:Z

    .line 13
    throw p1

    .line 14
    :cond_30
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getAutofillId()Landroid/view/autofill/AutofillId;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/ViewStructure;->setAutofillId(Landroid/view/autofill/AutofillId;)V

    .line 15
    invoke-virtual {p0, p1, p2}, Landroid/widget/LinearLayout;->onProvideAutofillStructure(Landroid/view/ViewStructure;I)V

    .line 16
    invoke-virtual {p0, p1, p2}, Landroid/widget/LinearLayout;->onProvideAutofillVirtualStructure(Landroid/view/ViewStructure;I)V

    .line 17
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->h:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/ViewStructure;->setChildCount(I)V

    .line 18
    :goto_46
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->h:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v0

    if-ge v2, v0, :cond_69

    .line 19
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->h:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 20
    invoke-virtual {p1, v2}, Landroid/view/ViewStructure;->newChild(I)Landroid/view/ViewStructure;

    move-result-object v1

    .line 21
    invoke-virtual {v0, v1, p2}, Landroid/view/View;->dispatchProvideAutofillStructure(Landroid/view/ViewStructure;I)V

    .line 22
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-ne v0, v3, :cond_66

    .line 23
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getHint()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/view/ViewStructure;->setHint(Ljava/lang/CharSequence;)V

    :cond_66
    add-int/lit8 v2, v2, 0x1

    goto :goto_46

    :cond_69
    :goto_69
    return-void
.end method

.method public dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->S0:Z

    .line 2
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchRestoreInstanceState(Landroid/util/SparseArray;)V

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->S0:Z

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->draw(Landroid/graphics/Canvas;)V

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->b(Landroid/graphics/Canvas;)V

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public drawableStateChanged()V
    .registers 5

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->R0:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->R0:Z

    .line 3
    invoke-super {p0}, Landroid/widget/LinearLayout;->drawableStateChanged()V

    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getDrawableState()[I

    move-result-object v1

    .line 5
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    const/4 v3, 0x0

    if-eqz v2, :cond_1a

    .line 6
    invoke-virtual {v2, v1}, Lc/a/a/a/d0/a;->a([I)Z

    move-result v1

    or-int/2addr v1, v3

    goto :goto_1b

    :cond_1a
    const/4 v1, 0x0

    .line 7
    :goto_1b
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz v2, :cond_30

    .line 8
    invoke-static {p0}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_2c

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_2c

    goto :goto_2d

    :cond_2c
    const/4 v0, 0x0

    :goto_2d
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->d(Z)V

    .line 9
    :cond_30
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->N()V

    .line 10
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->W()V

    if-eqz v1, :cond_3b

    .line 11
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->invalidate()V

    .line 12
    :cond_3b
    iput-boolean v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->R0:Z

    return-void
.end method

.method public final e()V
    .registers 7

    .line 1
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    iget-boolean v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->r0:Z

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->q0:Landroid/content/res/ColorStateList;

    iget-boolean v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->t0:Z

    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->s0:Landroid/graphics/PorterDuff$Mode;

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/internal/CheckableImageButton;ZLandroid/content/res/ColorStateList;ZLandroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public final f()V
    .registers 7

    .line 1
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->d0:Lcom/google/android/material/internal/CheckableImageButton;

    iget-boolean v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->f0:Z

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->e0:Landroid/content/res/ColorStateList;

    iget-boolean v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->h0:Z

    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->g0:Landroid/graphics/PorterDuff$Mode;

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/internal/CheckableImageButton;ZLandroid/content/res/ColorStateList;ZLandroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public final g()V
    .registers 4

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    const/4 v1, 0x0

    if-eqz v0, :cond_55

    const/4 v2, 0x1

    if-eq v0, v2, :cond_44

    const/4 v2, 0x2

    if-ne v0, v2, :cond_2b

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->H:Z

    if-eqz v0, :cond_1f

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    instance-of v0, v0, Lc/a/a/a/p0/c;

    if-nez v0, :cond_1f

    .line 3
    new-instance v0, Lc/a/a/a/p0/c;

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->M:Lc/a/a/a/l0/m;

    invoke-direct {v0, v2}, Lc/a/a/a/p0/c;-><init>(Lc/a/a/a/l0/m;)V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    goto :goto_28

    .line 4
    :cond_1f
    new-instance v0, Lc/a/a/a/l0/h;

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->M:Lc/a/a/a/l0/m;

    invoke-direct {v0, v2}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/m;)V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    .line 5
    :goto_28
    iput-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->L:Lc/a/a/a/l0/h;

    goto :goto_59

    .line 6
    :cond_2b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " is illegal; only @BoxBackgroundMode constants are supported."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 7
    :cond_44
    new-instance v0, Lc/a/a/a/l0/h;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->M:Lc/a/a/a/l0/m;

    invoke-direct {v0, v1}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/m;)V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    .line 8
    new-instance v0, Lc/a/a/a/l0/h;

    invoke-direct {v0}, Lc/a/a/a/l0/h;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->L:Lc/a/a/a/l0/h;

    goto :goto_59

    .line 9
    :cond_55
    iput-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    .line 10
    iput-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->L:Lc/a/a/a/l0/h;

    :goto_59
    return-void
.end method

.method public getBaseline()I
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz v0, :cond_13

    .line 2
    invoke-virtual {v0}, Landroid/widget/EditText;->getBaseline()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->i()I

    move-result v1

    add-int/2addr v0, v1

    return v0

    .line 3
    :cond_13
    invoke-super {p0}, Landroid/widget/LinearLayout;->getBaseline()I

    move-result v0

    return v0
.end method

.method public getBoxBackground()Lc/a/a/a/l0/h;
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_f

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    goto :goto_f

    .line 2
    :cond_9
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 3
    :cond_f
    :goto_f
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    return-object v0
.end method

.method public getBoxBackgroundColor()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->V:I

    return v0
.end method

.method public getBoxBackgroundMode()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    return v0
.end method

.method public getBoxCornerRadiusBottomEnd()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->c()F

    move-result v0

    return v0
.end method

.method public getBoxCornerRadiusBottomStart()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->d()F

    move-result v0

    return v0
.end method

.method public getBoxCornerRadiusTopEnd()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->t()F

    move-result v0

    return v0
.end method

.method public getBoxCornerRadiusTopStart()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->s()F

    move-result v0

    return v0
.end method

.method public getBoxStrokeColor()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->F0:I

    return v0
.end method

.method public getBoxStrokeErrorColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->G0:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getBoxStrokeWidth()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->S:I

    return v0
.end method

.method public getBoxStrokeWidthFocused()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->T:I

    return v0
.end method

.method public getCounterMaxLength()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->r:I

    return v0
.end method

.method public getCounterOverflowDescription()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->q:Z

    if-eqz v0, :cond_11

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->s:Z

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    if-eqz v0, :cond_11

    .line 2
    invoke-virtual {v0}, Landroid/widget/TextView;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0

    :cond_11
    const/4 v0, 0x0

    return-object v0
.end method

.method public getCounterOverflowTextColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->B:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getCounterTextColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->B:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getDefaultHintTextColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->B0:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getEditText()Landroid/widget/EditText;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    return-object v0
.end method

.method public getEndIconContentDescription()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getEndIconDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getEndIconMode()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->m0:I

    return v0
.end method

.method public getEndIconView()Lcom/google/android/material/internal/CheckableImageButton;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    return-object v0
.end method

.method public getError()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0}, Lc/a/a/a/p0/f;->m()Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0}, Lc/a/a/a/p0/f;->f()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    :goto_10
    return-object v0
.end method

.method public getErrorContentDescription()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0}, Lc/a/a/a/p0/f;->e()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getErrorCurrentTextColors()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0}, Lc/a/a/a/p0/f;->g()I

    move-result v0

    return v0
.end method

.method public getErrorIconDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public final getErrorTextCurrentColor()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0}, Lc/a/a/a/p0/f;->g()I

    move-result v0

    return v0
.end method

.method public getHelperText()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0}, Lc/a/a/a/p0/f;->n()Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    .line 2
    invoke-virtual {v0}, Lc/a/a/a/p0/f;->i()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    :goto_10
    return-object v0
.end method

.method public getHelperTextCurrentTextColor()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0}, Lc/a/a/a/p0/f;->j()I

    move-result v0

    return v0
.end method

.method public getHint()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->H:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->I:Ljava/lang/CharSequence;

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    return-object v0
.end method

.method public final getHintCollapsedTextHeight()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->h()F

    move-result v0

    return v0
.end method

.method public final getHintCurrentCollapsedTextColor()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->j()I

    move-result v0

    return v0
.end method

.method public getHintTextColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->C0:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getMaxWidth()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o:I

    return v0
.end method

.method public getMinWidth()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->n:I

    return v0
.end method

.method public getPasswordVisibilityToggleContentDescription()Ljava/lang/CharSequence;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getPasswordVisibilityToggleDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getPlaceholderText()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->x:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->w:Ljava/lang/CharSequence;

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    return-object v0
.end method

.method public getPlaceholderTextAppearance()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->A:I

    return v0
.end method

.method public getPlaceholderTextColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getPrefixText()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->D:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getPrefixTextColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->E:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getPrefixTextView()Landroid/widget/TextView;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->E:Landroid/widget/TextView;

    return-object v0
.end method

.method public getStartIconContentDescription()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->d0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getStartIconDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->d0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getSuffixText()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->F:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getSuffixTextColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->G:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getSuffixTextView()Landroid/widget/TextView;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->G:Landroid/widget/TextView;

    return-object v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->c0:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public final h()I
    .registers 4

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->V:I

    .line 2
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_14

    .line 3
    sget v0, Lc/a/a/a/b;->colorSurface:I

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lc/a/a/a/w/a;->a(Landroid/view/View;II)I

    move-result v0

    .line 4
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->V:I

    invoke-static {v0, v1}, Lc/a/a/a/w/a;->b(II)I

    move-result v0

    :cond_14
    return v0
.end method

.method public final i()I
    .registers 4

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->H:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 2
    :cond_6
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    if-eqz v0, :cond_1c

    const/4 v2, 0x1

    if-eq v0, v2, :cond_1c

    const/4 v2, 0x2

    if-eq v0, v2, :cond_11

    return v1

    .line 3
    :cond_11
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->h()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    :goto_1a
    float-to-int v0, v0

    return v0

    .line 4
    :cond_1c
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v0}, Lc/a/a/a/d0/a;->h()F

    move-result v0

    goto :goto_1a
.end method

.method public final j()Z
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_d

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->k()Z

    move-result v0

    if-eqz v0, :cond_d

    const/4 v0, 0x1

    goto :goto_e

    :cond_d
    const/4 v0, 0x0

    :goto_e
    return v0
.end method

.method public final k()Z
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->R:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_b

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->U:I

    if-eqz v0, :cond_b

    const/4 v0, 0x1

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return v0
.end method

.method public final l()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->m()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    check-cast v0, Lc/a/a/a/p0/c;

    invoke-virtual {v0}, Lc/a/a/a/p0/c;->G()V

    :cond_d
    return-void
.end method

.method public final m()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->H:Z

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->I:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_14

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    instance-of v0, v0, Lc/a/a/a/p0/c;

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    :goto_15
    return v0
.end method

.method public final n()V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l0:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/textfield/TextInputLayout$f;

    .line 2
    invoke-interface {v1, p0}, Lcom/google/android/material/textfield/TextInputLayout$f;->a(Lcom/google/android/material/textfield/TextInputLayout;)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final o()Z
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->m0:I

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public onLayout(ZIIII)V
    .registers 6

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz p1, :cond_56

    .line 3
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->W:Landroid/graphics/Rect;

    .line 4
    invoke-static {p0, p1, p2}, Lc/a/a/a/d0/c;->a(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 5
    invoke-virtual {p0, p2}, Lcom/google/android/material/textfield/TextInputLayout;->c(Landroid/graphics/Rect;)V

    .line 6
    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->H:Z

    if-eqz p1, :cond_56

    .line 7
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {p3}, Landroid/widget/EditText;->getTextSize()F

    move-result p3

    invoke-virtual {p1, p3}, Lc/a/a/a/d0/a;->g(F)V

    .line 8
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getGravity()I

    move-result p1

    .line 9
    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    and-int/lit8 p4, p1, -0x71

    or-int/lit8 p4, p4, 0x30

    invoke-virtual {p3, p4}, Lc/a/a/a/d0/a;->b(I)V

    .line 10
    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {p3, p1}, Lc/a/a/a/d0/a;->e(I)V

    .line 11
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {p0, p2}, Lcom/google/android/material/textfield/TextInputLayout;->a(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object p3

    invoke-virtual {p1, p3}, Lc/a/a/a/d0/a;->a(Landroid/graphics/Rect;)V

    .line 12
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {p0, p2}, Lcom/google/android/material/textfield/TextInputLayout;->b(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object p2

    invoke-virtual {p1, p2}, Lc/a/a/a/d0/a;->b(Landroid/graphics/Rect;)V

    .line 13
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {p1}, Lc/a/a/a/d0/a;->A()V

    .line 14
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->m()Z

    move-result p1

    if-eqz p1, :cond_56

    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->M0:Z

    if-nez p1, :cond_56

    .line 15
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->y()V

    :cond_56
    return-void
.end method

.method public onMeasure(II)V
    .registers 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->O()Z

    move-result p1

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->M()Z

    move-result p2

    if-nez p1, :cond_f

    if-eqz p2, :cond_19

    .line 4
    :cond_f
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    new-instance p2, Lcom/google/android/material/textfield/TextInputLayout$c;

    invoke-direct {p2, p0}, Lcom/google/android/material/textfield/TextInputLayout$c;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    .line 5
    :cond_19
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->Q()V

    .line 6
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->S()V

    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->U()V

    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 4

    .line 1
    instance-of v0, p1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;

    if-nez v0, :cond_8

    .line 2
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    .line 3
    :cond_8
    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;

    .line 4
    invoke-virtual {p1}, Landroidx/customview/view/AbsSavedState;->e()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/widget/LinearLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 5
    iget-object v0, p1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->j:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setError(Ljava/lang/CharSequence;)V

    .line 6
    iget-boolean v0, p1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->k:Z

    if-eqz v0, :cond_24

    .line 7
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    new-instance v1, Lcom/google/android/material/textfield/TextInputLayout$b;

    invoke-direct {v1, p0}, Lcom/google/android/material/textfield/TextInputLayout$b;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->post(Ljava/lang/Runnable;)Z

    .line 8
    :cond_24
    iget-object v0, p1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->l:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    .line 9
    iget-object v0, p1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->m:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperText(Ljava/lang/CharSequence;)V

    .line 10
    iget-object p1, p1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->n:Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderText(Ljava/lang/CharSequence;)V

    .line 11
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 2
    new-instance v1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;

    invoke-direct {v1, v0}, Lcom/google/android/material/textfield/TextInputLayout$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0}, Lc/a/a/a/p0/f;->d()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getError()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, v1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->j:Ljava/lang/CharSequence;

    .line 5
    :cond_17
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->o()Z

    move-result v0

    if-eqz v0, :cond_27

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Lcom/google/android/material/internal/CheckableImageButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_27

    const/4 v0, 0x1

    goto :goto_28

    :cond_27
    const/4 v0, 0x0

    :goto_28
    iput-boolean v0, v1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->k:Z

    .line 6
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getHint()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, v1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->l:Ljava/lang/CharSequence;

    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getHelperText()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, v1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->m:Ljava/lang/CharSequence;

    .line 8
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getPlaceholderText()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, v1, Lcom/google/android/material/textfield/TextInputLayout$SavedState;->n:Ljava/lang/CharSequence;

    return-object v1
.end method

.method public final p()V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    if-eqz v0, :cond_12

    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->x:Z

    if-eqz v1, :cond_12

    const/4 v1, 0x0

    .line 2
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_12
    return-void
.end method

.method public q()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->k:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_12

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    return v0
.end method

.method public final r()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method public s()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0}, Lc/a/a/a/p0/f;->n()Z

    move-result v0

    return v0
.end method

.method public setBoxBackgroundColor(I)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->V:I

    if-eq v0, p1, :cond_f

    .line 2
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->V:I

    .line 3
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->H0:I

    .line 4
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->J0:I

    .line 5
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->K0:I

    .line 6
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->c()V

    :cond_f
    return-void
.end method

.method public setBoxBackgroundColorResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setBoxBackgroundColor(I)V

    return-void
.end method

.method public setBoxBackgroundColorStateList(Landroid/content/res/ColorStateList;)V
    .registers 5

    .line 1
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->H0:I

    .line 2
    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->V:I

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, -0x101009e

    aput v2, v0, v1

    const/4 v1, -0x1

    .line 3
    invoke-virtual {p1, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->I0:I

    const/4 v0, 0x2

    new-array v2, v0, [I

    .line 4
    fill-array-data v2, :array_34

    .line 5
    invoke-virtual {p1, v2, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    iput v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->J0:I

    new-array v0, v0, [I

    .line 6
    fill-array-data v0, :array_3c

    .line 7
    invoke-virtual {p1, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->K0:I

    .line 8
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->c()V

    return-void

    nop

    :array_34
    .array-data 4
        0x101009c
        0x101009e
    .end array-data

    :array_3c
    .array-data 4
        0x1010367
        0x101009e
    .end array-data
.end method

.method public setBoxBackgroundMode(I)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    if-ne p1, v0, :cond_5

    return-void

    .line 2
    :cond_5
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    .line 3
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz p1, :cond_e

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->x()V

    :cond_e
    return-void
.end method

.method public setBoxStrokeColor(I)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->F0:I

    if-eq v0, p1, :cond_9

    .line 2
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->F0:I

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->W()V

    :cond_9
    return-void
.end method

.method public setBoxStrokeColorStateList(Landroid/content/res/ColorStateList;)V
    .registers 5

    .line 1
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_34

    .line 2
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->D0:I

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, -0x101009e

    aput v2, v0, v1

    const/4 v1, -0x1

    .line 3
    invoke-virtual {p1, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->L0:I

    const/4 v0, 0x2

    new-array v2, v0, [I

    .line 4
    fill-array-data v2, :array_46

    .line 5
    invoke-virtual {p1, v2, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    iput v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->E0:I

    new-array v0, v0, [I

    .line 6
    fill-array-data v0, :array_4e

    .line 7
    invoke-virtual {p1, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->F0:I

    goto :goto_42

    .line 8
    :cond_34
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->F0:I

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    if-eq v0, v1, :cond_42

    .line 9
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->F0:I

    .line 10
    :cond_42
    :goto_42
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->W()V

    return-void

    :array_46
    .array-data 4
        0x1010367
        0x101009e
    .end array-data

    :array_4e
    .array-data 4
        0x101009c
        0x101009e
    .end array-data
.end method

.method public setBoxStrokeErrorColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->G0:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_9

    .line 2
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->G0:Landroid/content/res/ColorStateList;

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->W()V

    :cond_9
    return-void
.end method

.method public setBoxStrokeWidth(I)V
    .registers 2

    .line 1
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->S:I

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->W()V

    return-void
.end method

.method public setBoxStrokeWidthFocused(I)V
    .registers 2

    .line 1
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->T:I

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->W()V

    return-void
.end method

.method public setBoxStrokeWidthFocusedResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setBoxStrokeWidthFocused(I)V

    return-void
.end method

.method public setBoxStrokeWidthResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setBoxStrokeWidth(I)V

    return-void
.end method

.method public setCounterEnabled(Z)V
    .registers 5

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->q:Z

    if-eq v0, p1, :cond_55

    const/4 v0, 0x2

    if-eqz p1, :cond_49

    .line 2
    new-instance v1, Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    .line 3
    sget v2, Lc/a/a/a/f;->textinput_counter:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setId(I)V

    .line 4
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->c0:Landroid/graphics/Typeface;

    if-eqz v1, :cond_20

    .line 5
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 6
    :cond_20
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 7
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    invoke-virtual {v1, v2, v0}, Lc/a/a/a/p0/f;->a(Landroid/widget/TextView;I)V

    .line 8
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    .line 9
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lc/a/a/a/d;->mtrl_textinput_counter_margin_start:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    .line 11
    invoke-static {v0, v1}, Lb/h/m/h;->b(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    .line 12
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->K()V

    .line 13
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->J()V

    goto :goto_53

    .line 14
    :cond_49
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    invoke-virtual {v1, v2, v0}, Lc/a/a/a/p0/f;->b(Landroid/widget/TextView;I)V

    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    .line 16
    :goto_53
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->q:Z

    :cond_55
    return-void
.end method

.method public setCounterMaxLength(I)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->r:I

    if-eq v0, p1, :cond_13

    if-lez p1, :cond_9

    .line 2
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->r:I

    goto :goto_c

    :cond_9
    const/4 p1, -0x1

    .line 3
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->r:I

    .line 4
    :goto_c
    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->q:Z

    if-eqz p1, :cond_13

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->J()V

    :cond_13
    return-void
.end method

.method public setCounterOverflowTextAppearance(I)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->u:I

    if-eq v0, p1, :cond_9

    .line 2
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->u:I

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->K()V

    :cond_9
    return-void
.end method

.method public setCounterOverflowTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->C:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_9

    .line 2
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->C:Landroid/content/res/ColorStateList;

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->K()V

    :cond_9
    return-void
.end method

.method public setCounterTextAppearance(I)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->v:I

    if-eq v0, p1, :cond_9

    .line 2
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->v:I

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->K()V

    :cond_9
    return-void
.end method

.method public setCounterTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->B:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_9

    .line 2
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->B:Landroid/content/res/ColorStateList;

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->K()V

    :cond_9
    return-void
.end method

.method public setDefaultHintTextColor(Landroid/content/res/ColorStateList;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->B0:Landroid/content/res/ColorStateList;

    .line 2
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->C0:Landroid/content/res/ColorStateList;

    .line 3
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz p1, :cond_c

    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->d(Z)V

    :cond_c
    return-void
.end method

.method public setEnabled(Z)V
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Landroid/view/ViewGroup;Z)V

    .line 2
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    return-void
.end method

.method public setEndIconActivated(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setActivated(Z)V

    return-void
.end method

.method public setEndIconCheckable(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Lcom/google/android/material/internal/CheckableImageButton;->setCheckable(Z)V

    return-void
.end method

.method public setEndIconContentDescription(I)V
    .registers 3

    if-eqz p1, :cond_b

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setEndIconContentDescription(Ljava/lang/CharSequence;)V
    .registers 3

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getEndIconContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eq v0, p1, :cond_b

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_b
    return-void
.end method

.method public setEndIconDrawable(I)V
    .registers 3

    if-eqz p1, :cond_b

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setEndIconDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->z()V

    return-void
.end method

.method public setEndIconMode(I)V
    .registers 5

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->m0:I

    .line 2
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->m0:I

    .line 3
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->a(I)V

    if-eqz p1, :cond_b

    const/4 v0, 0x1

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    .line 4
    :goto_c
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconVisible(Z)V

    .line 5
    invoke-direct {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getEndIconDelegate()Lc/a/a/a/p0/e;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    invoke-virtual {v0, v1}, Lc/a/a/a/p0/e;->a(I)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 6
    invoke-direct {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getEndIconDelegate()Lc/a/a/a/p0/e;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/p0/e;->a()V

    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->e()V

    return-void

    .line 8
    :cond_26
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The current box background mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " is not supported by the end icon mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setEndIconOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->x0:Landroid/view/View$OnLongClickListener;

    invoke-static {v0, p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setEndIconOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->x0:Landroid/view/View$OnLongClickListener;

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {v0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->b(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setEndIconTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->q0:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_c

    .line 2
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->q0:Landroid/content/res/ColorStateList;

    const/4 p1, 0x1

    .line 3
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->r0:Z

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->e()V

    :cond_c
    return-void
.end method

.method public setEndIconTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->s0:Landroid/graphics/PorterDuff$Mode;

    if-eq v0, p1, :cond_c

    .line 2
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->s0:Landroid/graphics/PorterDuff$Mode;

    const/4 p1, 0x1

    .line 3
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->t0:Z

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->e()V

    :cond_c
    return-void
.end method

.method public setEndIconVisible(Z)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->q()Z

    move-result v0

    if-eq v0, p1, :cond_17

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    if-eqz p1, :cond_c

    const/4 p1, 0x0

    goto :goto_e

    :cond_c
    const/16 p1, 0x8

    :goto_e
    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->U()V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->M()Z

    :cond_17
    return-void
.end method

.method public setError(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0}, Lc/a/a/a/p0/f;->m()Z

    move-result v0

    if-nez v0, :cond_13

    .line 2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_f

    return-void

    :cond_f
    const/4 v0, 0x1

    .line 3
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorEnabled(Z)V

    .line 4
    :cond_13
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1f

    .line 5
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/p0/f;->b(Ljava/lang/CharSequence;)V

    goto :goto_24

    .line 6
    :cond_1f
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {p1}, Lc/a/a/a/p0/f;->k()V

    :goto_24
    return-void
.end method

.method public setErrorContentDescription(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/p0/f;->a(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setErrorEnabled(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/p0/f;->a(Z)V

    return-void
.end method

.method public setErrorIconDrawable(I)V
    .registers 3

    if-eqz p1, :cond_b

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->A()V

    return-void
.end method

.method public setErrorIconDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eqz p1, :cond_11

    .line 4
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {p1}, Lc/a/a/a/p0/f;->m()Z

    move-result p1

    if-eqz p1, :cond_11

    const/4 p1, 0x1

    goto :goto_12

    :cond_11
    const/4 p1, 0x0

    :goto_12
    invoke-direct {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorIconVisible(Z)V

    return-void
.end method

.method public setErrorIconOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->y0:Landroid/view/View$OnLongClickListener;

    invoke-static {v0, p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setErrorIconOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->y0:Landroid/view/View$OnLongClickListener;

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {v0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->b(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setErrorIconTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->A0:Landroid/content/res/ColorStateList;

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 3
    invoke-static {v0}, Lb/h/f/l/a;->i(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 4
    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 5
    :cond_15
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {p1}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eq p1, v0, :cond_22

    .line 6
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_22
    return-void
.end method

.method public setErrorIconTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 2
    invoke-static {v0}, Lb/h/f/l/a;->i(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 3
    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 4
    :cond_13
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {p1}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eq p1, v0, :cond_20

    .line 5
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->z0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_20
    return-void
.end method

.method public setErrorTextAppearance(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/p0/f;->d(I)V

    return-void
.end method

.method public setErrorTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/p0/f;->a(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setExpandedHintEnabled(Z)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->O0:Z

    if-eq v0, p1, :cond_a

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->O0:Z

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->d(Z)V

    :cond_a
    return-void
.end method

.method public setHelperText(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->s()Z

    move-result p1

    if-eqz p1, :cond_20

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperTextEnabled(Z)V

    goto :goto_20

    .line 4
    :cond_11
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->s()Z

    move-result v0

    if-nez v0, :cond_1b

    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperTextEnabled(Z)V

    .line 6
    :cond_1b
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/p0/f;->c(Ljava/lang/CharSequence;)V

    :cond_20
    :goto_20
    return-void
.end method

.method public setHelperTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/p0/f;->b(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setHelperTextEnabled(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/p0/f;->b(Z)V

    return-void
.end method

.method public setHelperTextTextAppearance(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/p0/f;->e(I)V

    return-void
.end method

.method public setHint(I)V
    .registers 3

    if-eqz p1, :cond_b

    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setHint(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->H:Z

    if-eqz v0, :cond_c

    .line 2
    invoke-direct {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setHintInternal(Ljava/lang/CharSequence;)V

    const/16 p1, 0x800

    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->sendAccessibilityEvent(I)V

    :cond_c
    return-void
.end method

.method public setHintAnimationEnabled(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->P0:Z

    return-void
.end method

.method public setHintEnabled(Z)V
    .registers 4

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->H:Z

    if-eq p1, v0, :cond_51

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->H:Z

    const/4 v0, 0x0

    if-nez p1, :cond_2b

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->J:Z

    .line 4
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->I:Ljava/lang/CharSequence;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_27

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_27

    .line 5
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->I:Ljava/lang/CharSequence;

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 6
    :cond_27
    invoke-direct {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setHintInternal(Ljava/lang/CharSequence;)V

    goto :goto_4a

    .line 7
    :cond_2b
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    move-result-object p1

    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_47

    .line 9
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->I:Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_42

    .line 10
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    .line 11
    :cond_42
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    :cond_47
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->J:Z

    .line 13
    :goto_4a
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz p1, :cond_51

    .line 14
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->P()V

    :cond_51
    return-void
.end method

.method public setHintTextAppearance(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->a(I)V

    .line 2
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {p1}, Lc/a/a/a/d0/a;->f()Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->C0:Landroid/content/res/ColorStateList;

    .line 3
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz p1, :cond_18

    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->d(Z)V

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->P()V

    :cond_18
    return-void
.end method

.method public setHintTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->C0:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_17

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->B0:Landroid/content/res/ColorStateList;

    if-nez v0, :cond_d

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->b(Landroid/content/res/ColorStateList;)V

    .line 4
    :cond_d
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->C0:Landroid/content/res/ColorStateList;

    .line 5
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz p1, :cond_17

    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->d(Z)V

    :cond_17
    return-void
.end method

.method public setMaxWidth(I)V
    .registers 4

    .line 1
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->o:I

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz v0, :cond_c

    const/4 v1, -0x1

    if-eq p1, v1, :cond_c

    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setMaxWidth(I)V

    :cond_c
    return-void
.end method

.method public setMaxWidthResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setMaxWidth(I)V

    return-void
.end method

.method public setMinWidth(I)V
    .registers 4

    .line 1
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->n:I

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz v0, :cond_c

    const/4 v1, -0x1

    if-eq p1, v1, :cond_c

    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setMinWidth(I)V

    :cond_c
    return-void
.end method

.method public setMinWidthResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setMinWidth(I)V

    return-void
.end method

.method public setPasswordVisibilityToggleContentDescription(I)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    if-eqz p1, :cond_b

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    .line 2
    :goto_c
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setPasswordVisibilityToggleContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setPasswordVisibilityToggleContentDescription(Ljava/lang/CharSequence;)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setPasswordVisibilityToggleDrawable(I)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    if-eqz p1, :cond_b

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    .line 2
    :goto_c
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setPasswordVisibilityToggleDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setPasswordVisibilityToggleDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setPasswordVisibilityToggleEnabled(Z)V
    .registers 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    if-eqz p1, :cond_b

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->m0:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_b

    .line 2
    invoke-virtual {p0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconMode(I)V

    goto :goto_11

    :cond_b
    if-nez p1, :cond_11

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconMode(I)V

    :cond_11
    :goto_11
    return-void
.end method

.method public setPasswordVisibilityToggleTintList(Landroid/content/res/ColorStateList;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->q0:Landroid/content/res/ColorStateList;

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->r0:Z

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->e()V

    return-void
.end method

.method public setPasswordVisibilityToggleTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->s0:Landroid/graphics/PorterDuff$Mode;

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->t0:Z

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->e()V

    return-void
.end method

.method public setPlaceholderText(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->x:Z

    if-eqz v0, :cond_f

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_f

    const/4 p1, 0x0

    .line 2
    invoke-direct {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderTextEnabled(Z)V

    goto :goto_19

    .line 3
    :cond_f
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->x:Z

    if-nez v0, :cond_17

    const/4 v0, 0x1

    .line 4
    invoke-direct {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderTextEnabled(Z)V

    .line 5
    :cond_17
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->w:Ljava/lang/CharSequence;

    .line 6
    :goto_19
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->R()V

    return-void
.end method

.method public setPlaceholderTextAppearance(I)V
    .registers 3

    .line 1
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->A:I

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    if-eqz v0, :cond_9

    .line 3
    invoke-static {v0, p1}, Lb/h/n/i;->d(Landroid/widget/TextView;I)V

    :cond_9
    return-void
.end method

.method public setPlaceholderTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->z:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_f

    .line 2
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->z:Landroid/content/res/ColorStateList;

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->y:Landroid/widget/TextView;

    if-eqz v0, :cond_f

    if-eqz p1, :cond_f

    .line 4
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_f
    return-void
.end method

.method public setPrefixText(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    goto :goto_9

    :cond_8
    move-object v0, p1

    :goto_9
    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->D:Ljava/lang/CharSequence;

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->E:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->T()V

    return-void
.end method

.method public setPrefixTextAppearance(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->E:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lb/h/n/i;->d(Landroid/widget/TextView;I)V

    return-void
.end method

.method public setPrefixTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->E:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setStartIconCheckable(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->d0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Lcom/google/android/material/internal/CheckableImageButton;->setCheckable(Z)V

    return-void
.end method

.method public setStartIconContentDescription(I)V
    .registers 3

    if-eqz p1, :cond_b

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setStartIconContentDescription(Ljava/lang/CharSequence;)V
    .registers 3

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getStartIconContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eq v0, p1, :cond_b

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->d0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_b
    return-void
.end method

.method public setStartIconDrawable(I)V
    .registers 3

    if-eqz p1, :cond_b

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setStartIconDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->d0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eqz p1, :cond_f

    const/4 p1, 0x1

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconVisible(Z)V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->B()V

    goto :goto_1d

    :cond_f
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconVisible(Z)V

    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 8
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconContentDescription(Ljava/lang/CharSequence;)V

    :goto_1d
    return-void
.end method

.method public setStartIconOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->d0:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->k0:Landroid/view/View$OnLongClickListener;

    invoke-static {v0, p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setStartIconOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->k0:Landroid/view/View$OnLongClickListener;

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->d0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {v0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->b(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setStartIconTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->e0:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_c

    .line 2
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->e0:Landroid/content/res/ColorStateList;

    const/4 p1, 0x1

    .line 3
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->f0:Z

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->f()V

    :cond_c
    return-void
.end method

.method public setStartIconTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->g0:Landroid/graphics/PorterDuff$Mode;

    if-eq v0, p1, :cond_c

    .line 2
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->g0:Landroid/graphics/PorterDuff$Mode;

    const/4 p1, 0x1

    .line 3
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->h0:Z

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->f()V

    :cond_c
    return-void
.end method

.method public setStartIconVisible(Z)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->w()Z

    move-result v0

    if-eq v0, p1, :cond_17

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->d0:Lcom/google/android/material/internal/CheckableImageButton;

    if-eqz p1, :cond_c

    const/4 p1, 0x0

    goto :goto_e

    :cond_c
    const/16 p1, 0x8

    :goto_e
    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->S()V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->M()Z

    :cond_17
    return-void
.end method

.method public setSuffixText(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    goto :goto_9

    :cond_8
    move-object v0, p1

    :goto_9
    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->F:Ljava/lang/CharSequence;

    .line 2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->G:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->V()V

    return-void
.end method

.method public setSuffixTextAppearance(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->G:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lb/h/n/i;->d(Landroid/widget/TextView;I)V

    return-void
.end method

.method public setSuffixTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->G:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setTextInputAccessibilityDelegate(Lcom/google/android/material/textfield/TextInputLayout$e;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    if-eqz v0, :cond_7

    .line 2
    invoke-static {v0, p1}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/a;)V

    :cond_7
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->c0:Landroid/graphics/Typeface;

    if-eq p1, v0, :cond_17

    .line 2
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->c0:Landroid/graphics/Typeface;

    .line 3
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/a;->e(Landroid/graphics/Typeface;)V

    .line 4
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->p:Lc/a/a/a/p0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/p0/f;->a(Landroid/graphics/Typeface;)V

    .line 5
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->t:Landroid/widget/TextView;

    if-eqz v0, :cond_17

    .line 6
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_17
    return-void
.end method

.method public final t()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->M0:Z

    return v0
.end method

.method public u()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->J:Z

    return v0
.end method

.method public final v()Z
    .registers 4

    .line 1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_14

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v0, v2, :cond_15

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    .line 2
    invoke-virtual {v0}, Landroid/widget/EditText;->getMinLines()I

    move-result v0

    if-gt v0, v1, :cond_14

    goto :goto_15

    :cond_14
    const/4 v1, 0x0

    :cond_15
    :goto_15
    return v1
.end method

.method public w()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->d0:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getVisibility()I

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method public final x()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->g()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->D()V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->W()V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->I()V

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->b()V

    .line 6
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->P:I

    if-eqz v0, :cond_16

    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->P()V

    :cond_16
    return-void
.end method

.method public final y()V
    .registers 5

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->m()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->b0:Landroid/graphics/RectF;

    .line 3
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->N0:Lc/a/a/a/d0/a;

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    .line 4
    invoke-virtual {v2}, Landroid/widget/EditText;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->l:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getGravity()I

    move-result v3

    .line 5
    invoke-virtual {v1, v0, v2, v3}, Lc/a/a/a/d0/a;->a(Landroid/graphics/RectF;II)V

    .line 6
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->a(Landroid/graphics/RectF;)V

    .line 7
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->R:I

    iput v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->O:I

    const/4 v2, 0x0

    .line 8
    iput v2, v0, Landroid/graphics/RectF;->top:F

    int-to-float v1, v1

    .line 9
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    move-result v1

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->offset(FF)V

    .line 11
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->K:Lc/a/a/a/l0/h;

    check-cast v1, Lc/a/a/a/p0/c;

    invoke-virtual {v1, v0}, Lc/a/a/a/p0/c;->a(Landroid/graphics/RectF;)V

    return-void
.end method

.method public z()V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->o0:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->q0:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    return-void
.end method
