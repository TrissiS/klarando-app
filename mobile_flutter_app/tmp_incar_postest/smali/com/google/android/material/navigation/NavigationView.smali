.class public Lcom/google/android/material/navigation/NavigationView;
.super Lcom/google/android/material/internal/ScrimInsetsFrameLayout;
.source "NavigationView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/navigation/NavigationView$SavedState;,
        Lcom/google/android/material/navigation/NavigationView$c;
    }
.end annotation


# static fields
.field public static final t:[I

.field public static final u:[I

.field public static final v:I


# instance fields
.field public final m:Lc/a/a/a/d0/e;

.field public final n:Lc/a/a/a/d0/f;

.field public o:Lcom/google/android/material/navigation/NavigationView$c;

.field public final p:I

.field public final q:[I

.field public r:Landroid/view/MenuInflater;

.field public s:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# direct methods
.method public static constructor <clinit>()V
    .registers 4

    const/4 v0, 0x1

    new-array v1, v0, [I

    const v2, 0x10100a0

    const/4 v3, 0x0

    aput v2, v1, v3

    .line 1
    sput-object v1, Lcom/google/android/material/navigation/NavigationView;->t:[I

    new-array v0, v0, [I

    const v1, -0x101009e

    aput v1, v0, v3

    .line 2
    sput-object v0, Lcom/google/android/material/navigation/NavigationView;->u:[I

    .line 3
    sget v0, Lc/a/a/a/k;->Widget_Design_NavigationView:I

    sput v0, Lcom/google/android/material/navigation/NavigationView;->v:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/navigation/NavigationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lc/a/a/a/b;->navigationViewStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/navigation/NavigationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 13

    .line 3
    sget v0, Lcom/google/android/material/navigation/NavigationView;->v:I

    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/q0/a/a;->b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/material/internal/ScrimInsetsFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p1, Lc/a/a/a/d0/f;

    invoke-direct {p1}, Lc/a/a/a/d0/f;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    const/4 p1, 0x2

    new-array p1, p1, [I

    .line 5
    iput-object p1, p0, Lcom/google/android/material/navigation/NavigationView;->q:[I

    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 7
    new-instance v0, Lc/a/a/a/d0/e;

    invoke-direct {v0, p1}, Lc/a/a/a/d0/e;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->m:Lc/a/a/a/d0/e;

    .line 8
    sget-object v2, Lc/a/a/a/l;->NavigationView:[I

    sget v4, Lcom/google/android/material/navigation/NavigationView;->v:I

    const/4 v6, 0x0

    new-array v5, v6, [I

    move-object v0, p1

    move-object v1, p2

    move v3, p3

    .line 9
    invoke-static/range {v0 .. v5}, Lc/a/a/a/d0/m;->d(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Lb/b/q/g0;

    move-result-object v0

    .line 10
    sget v1, Lc/a/a/a/l;->NavigationView_android_background:I

    invoke-virtual {v0, v1}, Lb/b/q/g0;->g(I)Z

    move-result v1

    if-eqz v1, :cond_3f

    .line 11
    sget v1, Lc/a/a/a/l;->NavigationView_android_background:I

    invoke-virtual {v0, v1}, Lb/b/q/g0;->b(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {p0, v1}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 12
    :cond_3f
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_4d

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    instance-of v1, v1, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v1, :cond_77

    .line 13
    :cond_4d
    sget v1, Lcom/google/android/material/navigation/NavigationView;->v:I

    .line 14
    invoke-static {p1, p2, p3, v1}, Lc/a/a/a/l0/m;->a(Landroid/content/Context;Landroid/util/AttributeSet;II)Lc/a/a/a/l0/m$b;

    move-result-object p2

    invoke-virtual {p2}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object p2

    .line 15
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    .line 16
    new-instance v1, Lc/a/a/a/l0/h;

    invoke-direct {v1, p2}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/m;)V

    .line 17
    instance-of p2, p3, Landroid/graphics/drawable/ColorDrawable;

    if-eqz p2, :cond_71

    .line 18
    check-cast p3, Landroid/graphics/drawable/ColorDrawable;

    .line 19
    invoke-virtual {p3}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result p2

    invoke-static {p2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    .line 20
    invoke-virtual {v1, p2}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    .line 21
    :cond_71
    invoke-virtual {v1, p1}, Lc/a/a/a/l0/h;->a(Landroid/content/Context;)V

    .line 22
    invoke-static {p0, v1}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 23
    :cond_77
    sget p2, Lc/a/a/a/l;->NavigationView_elevation:I

    invoke-virtual {v0, p2}, Lb/b/q/g0;->g(I)Z

    move-result p2

    if-eqz p2, :cond_89

    .line 24
    sget p2, Lc/a/a/a/l;->NavigationView_elevation:I

    invoke-virtual {v0, p2, v6}, Lb/b/q/g0;->c(II)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p0, p2}, Lcom/google/android/material/navigation/NavigationView;->setElevation(F)V

    .line 25
    :cond_89
    sget p2, Lc/a/a/a/l;->NavigationView_android_fitsSystemWindows:I

    invoke-virtual {v0, p2, v6}, Lb/b/q/g0;->a(IZ)Z

    move-result p2

    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setFitsSystemWindows(Z)V

    .line 26
    sget p2, Lc/a/a/a/l;->NavigationView_android_maxWidth:I

    invoke-virtual {v0, p2, v6}, Lb/b/q/g0;->c(II)I

    move-result p2

    iput p2, p0, Lcom/google/android/material/navigation/NavigationView;->p:I

    .line 27
    sget p2, Lc/a/a/a/l;->NavigationView_itemIconTint:I

    invoke-virtual {v0, p2}, Lb/b/q/g0;->g(I)Z

    move-result p2

    if-eqz p2, :cond_a9

    .line 28
    sget p2, Lc/a/a/a/l;->NavigationView_itemIconTint:I

    invoke-virtual {v0, p2}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    goto :goto_b0

    :cond_a9
    const p2, 0x1010038

    .line 29
    invoke-virtual {p0, p2}, Lcom/google/android/material/navigation/NavigationView;->a(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    .line 30
    :goto_b0
    sget p3, Lc/a/a/a/l;->NavigationView_itemTextAppearance:I

    invoke-virtual {v0, p3}, Lb/b/q/g0;->g(I)Z

    move-result p3

    const/4 v1, 0x1

    if-eqz p3, :cond_c1

    .line 31
    sget p3, Lc/a/a/a/l;->NavigationView_itemTextAppearance:I

    invoke-virtual {v0, p3, v6}, Lb/b/q/g0;->g(II)I

    move-result p3

    const/4 v2, 0x1

    goto :goto_c3

    :cond_c1
    const/4 p3, 0x0

    const/4 v2, 0x0

    .line 32
    :goto_c3
    sget v3, Lc/a/a/a/l;->NavigationView_itemIconSize:I

    invoke-virtual {v0, v3}, Lb/b/q/g0;->g(I)Z

    move-result v3

    if-eqz v3, :cond_d4

    .line 33
    sget v3, Lc/a/a/a/l;->NavigationView_itemIconSize:I

    invoke-virtual {v0, v3, v6}, Lb/b/q/g0;->c(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/google/android/material/navigation/NavigationView;->setItemIconSize(I)V

    :cond_d4
    const/4 v3, 0x0

    .line 34
    sget v4, Lc/a/a/a/l;->NavigationView_itemTextColor:I

    invoke-virtual {v0, v4}, Lb/b/q/g0;->g(I)Z

    move-result v4

    if-eqz v4, :cond_e3

    .line 35
    sget v3, Lc/a/a/a/l;->NavigationView_itemTextColor:I

    invoke-virtual {v0, v3}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    :cond_e3
    if-nez v2, :cond_ee

    if-nez v3, :cond_ee

    const v3, 0x1010036

    .line 36
    invoke-virtual {p0, v3}, Lcom/google/android/material/navigation/NavigationView;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    .line 37
    :cond_ee
    sget v4, Lc/a/a/a/l;->NavigationView_itemBackground:I

    invoke-virtual {v0, v4}, Lb/b/q/g0;->b(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-nez v4, :cond_100

    .line 38
    invoke-virtual {p0, v0}, Lcom/google/android/material/navigation/NavigationView;->b(Lb/b/q/g0;)Z

    move-result v5

    if-eqz v5, :cond_100

    .line 39
    invoke-virtual {p0, v0}, Lcom/google/android/material/navigation/NavigationView;->a(Lb/b/q/g0;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 40
    :cond_100
    sget v5, Lc/a/a/a/l;->NavigationView_itemHorizontalPadding:I

    invoke-virtual {v0, v5}, Lb/b/q/g0;->g(I)Z

    move-result v5

    if-eqz v5, :cond_113

    .line 41
    sget v5, Lc/a/a/a/l;->NavigationView_itemHorizontalPadding:I

    .line 42
    invoke-virtual {v0, v5, v6}, Lb/b/q/g0;->c(II)I

    move-result v5

    .line 43
    iget-object v7, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v7, v5}, Lc/a/a/a/d0/f;->c(I)V

    .line 44
    :cond_113
    sget v5, Lc/a/a/a/l;->NavigationView_itemIconPadding:I

    .line 45
    invoke-virtual {v0, v5, v6}, Lb/b/q/g0;->c(II)I

    move-result v5

    .line 46
    sget v7, Lc/a/a/a/l;->NavigationView_itemMaxLines:I

    invoke-virtual {v0, v7, v1}, Lb/b/q/g0;->d(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/google/android/material/navigation/NavigationView;->setItemMaxLines(I)V

    .line 47
    iget-object v7, p0, Lcom/google/android/material/navigation/NavigationView;->m:Lc/a/a/a/d0/e;

    new-instance v8, Lcom/google/android/material/navigation/NavigationView$a;

    invoke-direct {v8, p0}, Lcom/google/android/material/navigation/NavigationView$a;-><init>(Lcom/google/android/material/navigation/NavigationView;)V

    invoke-virtual {v7, v8}, Lb/b/p/j/g;->a(Lb/b/p/j/g$a;)V

    .line 48
    iget-object v7, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v7, v1}, Lc/a/a/a/d0/f;->b(I)V

    .line 49
    iget-object v1, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    iget-object v7, p0, Lcom/google/android/material/navigation/NavigationView;->m:Lc/a/a/a/d0/e;

    invoke-virtual {v1, p1, v7}, Lc/a/a/a/d0/f;->a(Landroid/content/Context;Lb/b/p/j/g;)V

    .line 50
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {p1, p2}, Lc/a/a/a/d0/f;->a(Landroid/content/res/ColorStateList;)V

    .line 51
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getOverScrollMode()I

    move-result p2

    invoke-virtual {p1, p2}, Lc/a/a/a/d0/f;->h(I)V

    if-eqz v2, :cond_14d

    .line 52
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {p1, p3}, Lc/a/a/a/d0/f;->g(I)V

    .line 53
    :cond_14d
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {p1, v3}, Lc/a/a/a/d0/f;->b(Landroid/content/res/ColorStateList;)V

    .line 54
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {p1, v4}, Lc/a/a/a/d0/f;->a(Landroid/graphics/drawable/Drawable;)V

    .line 55
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {p1, v5}, Lc/a/a/a/d0/f;->d(I)V

    .line 56
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationView;->m:Lc/a/a/a/d0/e;

    iget-object p2, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {p1, p2}, Lb/b/p/j/g;->a(Lb/b/p/j/m;)V

    .line 57
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {p1, p0}, Lc/a/a/a/d0/f;->a(Landroid/view/ViewGroup;)Lb/b/p/j/n;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 58
    sget p1, Lc/a/a/a/l;->NavigationView_menu:I

    invoke-virtual {v0, p1}, Lb/b/q/g0;->g(I)Z

    move-result p1

    if-eqz p1, :cond_17f

    .line 59
    sget p1, Lc/a/a/a/l;->NavigationView_menu:I

    invoke-virtual {v0, p1, v6}, Lb/b/q/g0;->g(II)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/navigation/NavigationView;->c(I)V

    .line 60
    :cond_17f
    sget p1, Lc/a/a/a/l;->NavigationView_headerLayout:I

    invoke-virtual {v0, p1}, Lb/b/q/g0;->g(I)Z

    move-result p1

    if-eqz p1, :cond_190

    .line 61
    sget p1, Lc/a/a/a/l;->NavigationView_headerLayout:I

    invoke-virtual {v0, p1, v6}, Lb/b/q/g0;->g(II)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/navigation/NavigationView;->b(I)Landroid/view/View;

    .line 62
    :cond_190
    invoke-virtual {v0}, Lb/b/q/g0;->b()V

    .line 63
    invoke-virtual {p0}, Lcom/google/android/material/navigation/NavigationView;->a()V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/navigation/NavigationView;)[I
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/navigation/NavigationView;->q:[I

    return-object p0
.end method

.method public static synthetic b(Lcom/google/android/material/navigation/NavigationView;)Lc/a/a/a/d0/f;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    return-object p0
.end method

.method private getMenuInflater()Landroid/view/MenuInflater;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->r:Landroid/view/MenuInflater;

    if-nez v0, :cond_f

    .line 2
    new-instance v0, Lb/b/p/g;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lb/b/p/g;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->r:Landroid/view/MenuInflater;

    .line 3
    :cond_f
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->r:Landroid/view/MenuInflater;

    return-object v0
.end method


# virtual methods
.method public final a(I)Landroid/content/res/ColorStateList;
    .registers 11

    .line 18
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    const/4 v1, 0x0

    if-nez p1, :cond_16

    return-object v1

    .line 20
    :cond_16
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    iget v3, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-static {p1, v3}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    .line 21
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    .line 22
    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    sget v4, Lb/b/a;->colorPrimary:I

    .line 23
    invoke-virtual {v3, v4, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v3

    if-nez v3, :cond_31

    return-object v1

    .line 24
    :cond_31
    iget v0, v0, Landroid/util/TypedValue;->data:I

    .line 25
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    .line 26
    new-instance v3, Landroid/content/res/ColorStateList;

    const/4 v4, 0x3

    new-array v5, v4, [[I

    sget-object v6, Lcom/google/android/material/navigation/NavigationView;->u:[I

    const/4 v7, 0x0

    aput-object v6, v5, v7

    sget-object v6, Lcom/google/android/material/navigation/NavigationView;->t:[I

    aput-object v6, v5, v2

    sget-object v6, Landroid/widget/FrameLayout;->EMPTY_STATE_SET:[I

    const/4 v8, 0x2

    aput-object v6, v5, v8

    new-array v4, v4, [I

    sget-object v6, Lcom/google/android/material/navigation/NavigationView;->u:[I

    .line 27
    invoke-virtual {p1, v6, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    aput p1, v4, v7

    aput v0, v4, v2

    aput v1, v4, v8

    invoke-direct {v3, v5, v4}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v3
.end method

.method public final a(Lb/b/q/g0;)Landroid/graphics/drawable/Drawable;
    .registers 11

    .line 2
    sget v0, Lc/a/a/a/l;->NavigationView_itemShapeAppearance:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lb/b/q/g0;->g(II)I

    move-result v0

    .line 3
    sget v2, Lc/a/a/a/l;->NavigationView_itemShapeAppearanceOverlay:I

    .line 4
    invoke-virtual {p1, v2, v1}, Lb/b/q/g0;->g(II)I

    move-result v2

    .line 5
    new-instance v4, Lc/a/a/a/l0/h;

    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    .line 7
    invoke-static {v3, v0, v2}, Lc/a/a/a/l0/m;->a(Landroid/content/Context;II)Lc/a/a/a/l0/m$b;

    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object v0

    invoke-direct {v4, v0}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/m;)V

    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lc/a/a/a/l;->NavigationView_itemShapeFillColor:I

    .line 10
    invoke-static {v0, p1, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Lb/b/q/g0;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 11
    invoke-virtual {v4, v0}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    .line 12
    sget v0, Lc/a/a/a/l;->NavigationView_itemShapeInsetStart:I

    invoke-virtual {p1, v0, v1}, Lb/b/q/g0;->c(II)I

    move-result v5

    .line 13
    sget v0, Lc/a/a/a/l;->NavigationView_itemShapeInsetTop:I

    invoke-virtual {p1, v0, v1}, Lb/b/q/g0;->c(II)I

    move-result v6

    .line 14
    sget v0, Lc/a/a/a/l;->NavigationView_itemShapeInsetEnd:I

    invoke-virtual {p1, v0, v1}, Lb/b/q/g0;->c(II)I

    move-result v7

    .line 15
    sget v0, Lc/a/a/a/l;->NavigationView_itemShapeInsetBottom:I

    invoke-virtual {p1, v0, v1}, Lb/b/q/g0;->c(II)I

    move-result v8

    .line 16
    new-instance p1, Landroid/graphics/drawable/InsetDrawable;

    move-object v3, p1

    invoke-direct/range {v3 .. v8}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    return-object p1
.end method

.method public final a()V
    .registers 3

    .line 28
    new-instance v0, Lcom/google/android/material/navigation/NavigationView$b;

    invoke-direct {v0, p0}, Lcom/google/android/material/navigation/NavigationView$b;-><init>(Lcom/google/android/material/navigation/NavigationView;)V

    iput-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->s:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/material/navigation/NavigationView;->s:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method

.method public a(Lb/h/m/g0;)V
    .registers 3

    .line 17
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f;->a(Lb/h/m/g0;)V

    return-void
.end method

.method public b(I)Landroid/view/View;
    .registers 3

    .line 4
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f;->a(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public final b(Lb/b/q/g0;)Z
    .registers 3

    .line 2
    sget v0, Lc/a/a/a/l;->NavigationView_itemShapeAppearance:I

    invoke-virtual {p1, v0}, Lb/b/q/g0;->g(I)Z

    move-result v0

    if-nez v0, :cond_13

    sget v0, Lc/a/a/a/l;->NavigationView_itemShapeAppearanceOverlay:I

    .line 3
    invoke-virtual {p1, v0}, Lb/b/q/g0;->g(I)Z

    move-result p1

    if-eqz p1, :cond_11

    goto :goto_13

    :cond_11
    const/4 p1, 0x0

    goto :goto_14

    :cond_13
    :goto_13
    const/4 p1, 0x1

    :goto_14
    return p1
.end method

.method public c(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lc/a/a/a/d0/f;->c(Z)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/navigation/NavigationView;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/material/navigation/NavigationView;->m:Lc/a/a/a/d0/e;

    invoke-virtual {v0, p1, v1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 3
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lc/a/a/a/d0/f;->c(Z)V

    .line 4
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {p1, v0}, Lc/a/a/a/d0/f;->a(Z)V

    return-void
.end method

.method public getCheckedItem()Landroid/view/MenuItem;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0}, Lc/a/a/a/d0/f;->b()Lb/b/p/j/i;

    move-result-object v0

    return-object v0
.end method

.method public getHeaderCount()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0}, Lc/a/a/a/d0/f;->e()I

    move-result v0

    return v0
.end method

.method public getItemBackground()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0}, Lc/a/a/a/d0/f;->f()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getItemHorizontalPadding()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0}, Lc/a/a/a/d0/f;->g()I

    move-result v0

    return v0
.end method

.method public getItemIconPadding()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0}, Lc/a/a/a/d0/f;->h()I

    move-result v0

    return v0
.end method

.method public getItemIconTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0}, Lc/a/a/a/d0/f;->k()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getItemMaxLines()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0}, Lc/a/a/a/d0/f;->i()I

    move-result v0

    return v0
.end method

.method public getItemTextColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0}, Lc/a/a/a/d0/f;->j()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getMenu()Landroid/view/Menu;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->m:Lc/a/a/a/d0/e;

    return-object v0
.end method

.method public onAttachedToWindow()V
    .registers 1

    .line 1
    invoke-super {p0}, Lcom/google/android/material/internal/ScrimInsetsFrameLayout;->onAttachedToWindow()V

    .line 2
    invoke-static {p0}, Lc/a/a/a/l0/i;->a(Landroid/view/View;)V

    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 3

    .line 1
    invoke-super {p0}, Lcom/google/android/material/internal/ScrimInsetsFrameLayout;->onDetachedFromWindow()V

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_13

    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/material/navigation/NavigationView;->s:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_1c

    .line 4
    :cond_13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/material/navigation/NavigationView;->s:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :goto_1c
    return-void
.end method

.method public onMeasure(II)V
    .registers 6

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/high16 v1, -0x80000000

    const/high16 v2, 0x40000000    # 2.0f

    if-eq v0, v1, :cond_14

    if-eqz v0, :cond_d

    goto :goto_22

    .line 2
    :cond_d
    iget p1, p0, Lcom/google/android/material/navigation/NavigationView;->p:I

    invoke-static {p1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    goto :goto_22

    .line 3
    :cond_14
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    iget v0, p0, Lcom/google/android/material/navigation/NavigationView;->p:I

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 4
    invoke-static {p1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 5
    :goto_22
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 3

    .line 1
    instance-of v0, p1, Lcom/google/android/material/navigation/NavigationView$SavedState;

    if-nez v0, :cond_8

    .line 2
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    .line 3
    :cond_8
    check-cast p1, Lcom/google/android/material/navigation/NavigationView$SavedState;

    .line 4
    invoke-virtual {p1}, Landroidx/customview/view/AbsSavedState;->e()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 5
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->m:Lc/a/a/a/d0/e;

    iget-object p1, p1, Lcom/google/android/material/navigation/NavigationView$SavedState;->j:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Lb/b/p/j/g;->d(Landroid/os/Bundle;)V

    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 2
    new-instance v1, Lcom/google/android/material/navigation/NavigationView$SavedState;

    invoke-direct {v1, v0}, Lcom/google/android/material/navigation/NavigationView$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 3
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, v1, Lcom/google/android/material/navigation/NavigationView$SavedState;->j:Landroid/os/Bundle;

    .line 4
    iget-object v2, p0, Lcom/google/android/material/navigation/NavigationView;->m:Lc/a/a/a/d0/e;

    invoke-virtual {v2, v0}, Lb/b/p/j/g;->f(Landroid/os/Bundle;)V

    return-object v1
.end method

.method public setCheckedItem(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->m:Lc/a/a/a/d0/e;

    invoke-virtual {v0, p1}, Lb/b/p/j/g;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-eqz p1, :cond_f

    .line 2
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    check-cast p1, Lb/b/p/j/i;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f;->a(Lb/b/p/j/i;)V

    :cond_f
    return-void
.end method

.method public setCheckedItem(Landroid/view/MenuItem;)V
    .registers 3

    .line 3
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->m:Lc/a/a/a/d0/e;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    invoke-virtual {v0, p1}, Lb/b/p/j/g;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-eqz p1, :cond_14

    .line 4
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    check-cast p1, Lb/b/p/j/i;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f;->a(Lb/b/p/j/i;)V

    return-void

    .line 5
    :cond_14
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Called setCheckedItem(MenuItem) with an item that is not in the current menu."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setElevation(F)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_9

    .line 2
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setElevation(F)V

    .line 3
    :cond_9
    invoke-static {p0, p1}, Lc/a/a/a/l0/i;->a(Landroid/view/View;F)V

    return-void
.end method

.method public setItemBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f;->a(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setItemBackgroundResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/h/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/navigation/NavigationView;->setItemBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setItemHorizontalPadding(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f;->c(I)V

    return-void
.end method

.method public setItemHorizontalPaddingResource(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f;->c(I)V

    return-void
.end method

.method public setItemIconPadding(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f;->d(I)V

    return-void
.end method

.method public setItemIconPaddingResource(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f;->d(I)V

    return-void
.end method

.method public setItemIconSize(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f;->e(I)V

    return-void
.end method

.method public setItemIconTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f;->a(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setItemMaxLines(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f;->f(I)V

    return-void
.end method

.method public setItemTextAppearance(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f;->g(I)V

    return-void
.end method

.method public setItemTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f;->b(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setNavigationItemSelectedListener(Lcom/google/android/material/navigation/NavigationView$c;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/navigation/NavigationView;->o:Lcom/google/android/material/navigation/NavigationView$c;

    return-void
.end method

.method public setOverScrollMode(I)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setOverScrollMode(I)V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationView;->n:Lc/a/a/a/d0/f;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f;->h(I)V

    :cond_a
    return-void
.end method
