.class public Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;
.super Lcom/google/android/material/button/MaterialButton;
.source "ExtendedFloatingActionButton.java"

# interfaces
.implements Landroidx/coordinatorlayout/widget/CoordinatorLayout$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$i;,
        Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$k;,
        Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$h;,
        Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$l;,
        Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;,
        Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;
    }
.end annotation


# static fields
.field public static final N:I

.field public static final O:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public static final P:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public static final Q:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public static final R:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final A:Lc/a/a/a/c0/a;

.field public final B:Lc/a/a/a/c0/f;

.field public final C:Lc/a/a/a/c0/f;

.field public final D:Lc/a/a/a/c0/f;

.field public final E:Lc/a/a/a/c0/f;

.field public final F:I

.field public G:I

.field public H:I

.field public final I:Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior<",
            "Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;",
            ">;"
        }
    .end annotation
.end field

.field public J:Z

.field public K:Z

.field public L:Z

.field public M:Landroid/content/res/ColorStateList;

.field public z:I


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    .line 1
    const-class v0, Ljava/lang/Float;

    sget v1, Lc/a/a/a/k;->Widget_MaterialComponents_ExtendedFloatingActionButton_Icon:I

    sput v1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->N:I

    .line 2
    new-instance v1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$d;

    const-string v2, "width"

    invoke-direct {v1, v0, v2}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$d;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->O:Landroid/util/Property;

    .line 3
    new-instance v1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$e;

    const-string v2, "height"

    invoke-direct {v1, v0, v2}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$e;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->P:Landroid/util/Property;

    .line 4
    new-instance v1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$f;

    const-string v2, "paddingStart"

    invoke-direct {v1, v0, v2}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$f;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->Q:Landroid/util/Property;

    .line 5
    new-instance v1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$g;

    const-string v2, "paddingEnd"

    invoke-direct {v1, v0, v2}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$g;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->R:Landroid/util/Property;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lc/a/a/a/b;->extendedFloatingActionButtonStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 14

    .line 3
    sget v0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->N:I

    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/q0/a/a;->b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/material/button/MaterialButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 4
    iput p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->z:I

    .line 5
    new-instance v0, Lc/a/a/a/c0/a;

    invoke-direct {v0}, Lc/a/a/a/c0/a;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->A:Lc/a/a/a/c0/a;

    .line 6
    new-instance v1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$k;

    invoke-direct {v1, p0, v0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$k;-><init>(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Lc/a/a/a/c0/a;)V

    iput-object v1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->D:Lc/a/a/a/c0/f;

    .line 7
    new-instance v0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$i;

    iget-object v1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->A:Lc/a/a/a/c0/a;

    invoke-direct {v0, p0, v1}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$i;-><init>(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Lc/a/a/a/c0/a;)V

    iput-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->E:Lc/a/a/a/c0/f;

    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->J:Z

    .line 9
    iput-boolean p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->K:Z

    .line 10
    iput-boolean p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->L:Z

    .line 11
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v7

    .line 12
    new-instance v1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;

    invoke-direct {v1, v7, p2}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$ExtendedFloatingActionButtonBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->I:Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    .line 13
    sget-object v3, Lc/a/a/a/l;->ExtendedFloatingActionButton:[I

    sget v5, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->N:I

    new-array v6, p1, [I

    move-object v1, v7

    move-object v2, p2

    move v4, p3

    .line 14
    invoke-static/range {v1 .. v6}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 15
    sget v2, Lc/a/a/a/l;->ExtendedFloatingActionButton_showMotionSpec:I

    .line 16
    invoke-static {v7, v1, v2}, Lc/a/a/a/m/h;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Lc/a/a/a/m/h;

    move-result-object v2

    .line 17
    sget v3, Lc/a/a/a/l;->ExtendedFloatingActionButton_hideMotionSpec:I

    .line 18
    invoke-static {v7, v1, v3}, Lc/a/a/a/m/h;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Lc/a/a/a/m/h;

    move-result-object v3

    .line 19
    sget v4, Lc/a/a/a/l;->ExtendedFloatingActionButton_extendMotionSpec:I

    .line 20
    invoke-static {v7, v1, v4}, Lc/a/a/a/m/h;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Lc/a/a/a/m/h;

    move-result-object v4

    .line 21
    sget v5, Lc/a/a/a/l;->ExtendedFloatingActionButton_shrinkMotionSpec:I

    .line 22
    invoke-static {v7, v1, v5}, Lc/a/a/a/m/h;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Lc/a/a/a/m/h;

    move-result-object v5

    .line 23
    sget v6, Lc/a/a/a/l;->ExtendedFloatingActionButton_collapsedSize:I

    const/4 v8, -0x1

    .line 24
    invoke-virtual {v1, v6, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->F:I

    .line 25
    invoke-static {p0}, Lb/h/m/y;->x(Landroid/view/View;)I

    move-result v6

    iput v6, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->G:I

    .line 26
    invoke-static {p0}, Lb/h/m/y;->w(Landroid/view/View;)I

    move-result v6

    iput v6, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->H:I

    .line 27
    new-instance v6, Lc/a/a/a/c0/a;

    invoke-direct {v6}, Lc/a/a/a/c0/a;-><init>()V

    .line 28
    new-instance v8, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$h;

    new-instance v9, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$a;

    invoke-direct {v9, p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$a;-><init>(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)V

    invoke-direct {v8, p0, v6, v9, v0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$h;-><init>(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Lc/a/a/a/c0/a;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$l;Z)V

    iput-object v8, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->C:Lc/a/a/a/c0/f;

    .line 29
    new-instance v0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$h;

    new-instance v8, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$b;

    invoke-direct {v8, p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$b;-><init>(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)V

    invoke-direct {v0, p0, v6, v8, p1}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$h;-><init>(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Lc/a/a/a/c0/a;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$l;Z)V

    iput-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->B:Lc/a/a/a/c0/f;

    .line 30
    iget-object p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->D:Lc/a/a/a/c0/f;

    invoke-interface {p1, v2}, Lc/a/a/a/c0/f;->a(Lc/a/a/a/m/h;)V

    .line 31
    iget-object p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->E:Lc/a/a/a/c0/f;

    invoke-interface {p1, v3}, Lc/a/a/a/c0/f;->a(Lc/a/a/a/m/h;)V

    .line 32
    iget-object p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->C:Lc/a/a/a/c0/f;

    invoke-interface {p1, v4}, Lc/a/a/a/c0/f;->a(Lc/a/a/a/m/h;)V

    .line 33
    iget-object p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->B:Lc/a/a/a/c0/f;

    invoke-interface {p1, v5}, Lc/a/a/a/c0/f;->a(Lc/a/a/a/m/h;)V

    .line 34
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 35
    sget p1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->N:I

    sget-object v0, Lc/a/a/a/l0/m;->m:Lc/a/a/a/l0/c;

    .line 36
    invoke-static {v7, p2, p3, p1, v0}, Lc/a/a/a/l0/m;->a(Landroid/content/Context;Landroid/util/AttributeSet;IILc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Lcom/google/android/material/button/MaterialButton;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    .line 39
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->j()V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->G:I

    return p0
.end method

.method public static synthetic a(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;I)I
    .registers 2

    .line 4
    iput p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->z:I

    return p1
.end method

.method public static synthetic a(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Lc/a/a/a/c0/f;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;)V
    .registers 3

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->a(Lc/a/a/a/c0/f;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;)V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Z)Z
    .registers 2

    .line 3
    iput-boolean p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->J:Z

    return p1
.end method

.method public static synthetic b(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->H:I

    return p0
.end method

.method public static synthetic b(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Z)Z
    .registers 2

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->K:Z

    return p1
.end method

.method public static synthetic c(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Z
    .registers 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->i()Z

    move-result p0

    return p0
.end method

.method public static synthetic d(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Z
    .registers 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->h()Z

    move-result p0

    return p0
.end method

.method public static synthetic e(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Lc/a/a/a/c0/f;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->B:Lc/a/a/a/c0/f;

    return-object p0
.end method

.method public static synthetic f(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Lc/a/a/a/c0/f;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->E:Lc/a/a/a/c0/f;

    return-object p0
.end method

.method public static synthetic g(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Lc/a/a/a/c0/f;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->C:Lc/a/a/a/c0/f;

    return-object p0
.end method

.method public static synthetic h(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Lc/a/a/a/c0/f;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->D:Lc/a/a/a/c0/f;

    return-object p0
.end method

.method public static synthetic i(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->J:Z

    return p0
.end method


# virtual methods
.method public a(Landroid/content/res/ColorStateList;)V
    .registers 2

    .line 5
    invoke-super {p0, p1}, Landroid/widget/Button;->setTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final a(Lc/a/a/a/c0/f;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;)V
    .registers 5

    .line 6
    invoke-interface {p1}, Lc/a/a/a/c0/f;->f()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 7
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->k()Z

    move-result v0

    if-nez v0, :cond_14

    .line 8
    invoke-interface {p1}, Lc/a/a/a/c0/f;->h()V

    .line 9
    invoke-interface {p1, p2}, Lc/a/a/a/c0/f;->a(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;)V

    return-void

    :cond_14
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0, v0}, Landroid/widget/Button;->measure(II)V

    .line 11
    invoke-interface {p1}, Lc/a/a/a/c0/f;->b()Landroid/animation/AnimatorSet;

    move-result-object v0

    .line 12
    new-instance v1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$c;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$c;-><init>(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Lc/a/a/a/c0/f;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;)V

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 13
    invoke-interface {p1}, Lc/a/a/a/c0/f;->e()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/animation/Animator$AnimatorListener;

    .line 14
    invoke-virtual {v0, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    goto :goto_2c

    .line 15
    :cond_3c
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    return-void
.end method

.method public getBehavior()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior<",
            "Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->I:Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    return-object v0
.end method

.method public getCollapsedPadding()I
    .registers 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->getCollapsedSize()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/material/button/MaterialButton;->getIconSize()I

    move-result v1

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public getCollapsedSize()I
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->F:I

    if-gez v0, :cond_17

    .line 2
    invoke-static {p0}, Lb/h/m/y;->x(Landroid/view/View;)I

    move-result v0

    invoke-static {p0}, Lb/h/m/y;->w(Landroid/view/View;)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    invoke-virtual {p0}, Lcom/google/android/material/button/MaterialButton;->getIconSize()I

    move-result v1

    add-int/2addr v0, v1

    :cond_17
    return v0
.end method

.method public getExtendMotionSpec()Lc/a/a/a/m/h;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->C:Lc/a/a/a/c0/f;

    invoke-interface {v0}, Lc/a/a/a/c0/f;->a()Lc/a/a/a/m/h;

    move-result-object v0

    return-object v0
.end method

.method public getHideMotionSpec()Lc/a/a/a/m/h;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->E:Lc/a/a/a/c0/f;

    invoke-interface {v0}, Lc/a/a/a/c0/f;->a()Lc/a/a/a/m/h;

    move-result-object v0

    return-object v0
.end method

.method public getShowMotionSpec()Lc/a/a/a/m/h;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->D:Lc/a/a/a/c0/f;

    invoke-interface {v0}, Lc/a/a/a/c0/f;->a()Lc/a/a/a/m/h;

    move-result-object v0

    return-object v0
.end method

.method public getShrinkMotionSpec()Lc/a/a/a/m/h;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->B:Lc/a/a/a/c0/f;

    invoke-interface {v0}, Lc/a/a/a/c0/f;->a()Lc/a/a/a/m/h;

    move-result-object v0

    return-object v0
.end method

.method public final h()Z
    .registers 5

    .line 2
    invoke-virtual {p0}, Landroid/widget/Button;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_e

    .line 3
    iget v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->z:I

    if-ne v0, v2, :cond_d

    const/4 v1, 0x1

    :cond_d
    return v1

    .line 4
    :cond_e
    iget v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->z:I

    const/4 v3, 0x2

    if-eq v0, v3, :cond_14

    const/4 v1, 0x1

    :cond_14
    return v1
.end method

.method public final i()Z
    .registers 5

    .line 2
    invoke-virtual {p0}, Landroid/widget/Button;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_f

    .line 3
    iget v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->z:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_e

    const/4 v1, 0x1

    :cond_e
    return v1

    .line 4
    :cond_f
    iget v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->z:I

    if-eq v0, v2, :cond_14

    const/4 v1, 0x1

    :cond_14
    return v1
.end method

.method public final j()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/Button;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->M:Landroid/content/res/ColorStateList;

    return-void
.end method

.method public final k()Z
    .registers 2

    .line 1
    invoke-static {p0}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_10

    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->i()Z

    move-result v0

    if-nez v0, :cond_18

    iget-boolean v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->L:Z

    if-eqz v0, :cond_18

    .line 2
    :cond_10
    invoke-virtual {p0}, Landroid/widget/Button;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_18

    const/4 v0, 0x1

    goto :goto_19

    :cond_18
    const/4 v0, 0x0

    :goto_19
    return v0
.end method

.method public onAttachedToWindow()V
    .registers 2

    .line 1
    invoke-super {p0}, Lcom/google/android/material/button/MaterialButton;->onAttachedToWindow()V

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->J:Z

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Lcom/google/android/material/button/MaterialButton;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_1f

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->J:Z

    .line 4
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->B:Lc/a/a/a/c0/f;

    invoke-interface {v0}, Lc/a/a/a/c0/f;->h()V

    :cond_1f
    return-void
.end method

.method public setAnimateShowBeforeLayout(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->L:Z

    return-void
.end method

.method public setExtendMotionSpec(Lc/a/a/a/m/h;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->C:Lc/a/a/a/c0/f;

    invoke-interface {v0, p1}, Lc/a/a/a/c0/f;->a(Lc/a/a/a/m/h;)V

    return-void
.end method

.method public setExtendMotionSpecResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lc/a/a/a/m/h;->a(Landroid/content/Context;I)Lc/a/a/a/m/h;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->setExtendMotionSpec(Lc/a/a/a/m/h;)V

    return-void
.end method

.method public setExtended(Z)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->J:Z

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    if-eqz p1, :cond_a

    .line 2
    iget-object p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->C:Lc/a/a/a/c0/f;

    goto :goto_c

    :cond_a
    iget-object p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->B:Lc/a/a/a/c0/f;

    .line 3
    :goto_c
    invoke-interface {p1}, Lc/a/a/a/c0/f;->f()Z

    move-result v0

    if-eqz v0, :cond_13

    return-void

    .line 4
    :cond_13
    invoke-interface {p1}, Lc/a/a/a/c0/f;->h()V

    return-void
.end method

.method public setHideMotionSpec(Lc/a/a/a/m/h;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->E:Lc/a/a/a/c0/f;

    invoke-interface {v0, p1}, Lc/a/a/a/c0/f;->a(Lc/a/a/a/m/h;)V

    return-void
.end method

.method public setHideMotionSpecResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lc/a/a/a/m/h;->a(Landroid/content/Context;I)Lc/a/a/a/m/h;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->setHideMotionSpec(Lc/a/a/a/m/h;)V

    return-void
.end method

.method public setPadding(IIII)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/Button;->setPadding(IIII)V

    .line 2
    iget-boolean p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->J:Z

    if-eqz p1, :cond_17

    iget-boolean p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->K:Z

    if-nez p1, :cond_17

    .line 3
    invoke-static {p0}, Lb/h/m/y;->x(Landroid/view/View;)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->G:I

    .line 4
    invoke-static {p0}, Lb/h/m/y;->w(Landroid/view/View;)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->H:I

    :cond_17
    return-void
.end method

.method public setPaddingRelative(IIII)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/Button;->setPaddingRelative(IIII)V

    .line 2
    iget-boolean p2, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->J:Z

    if-eqz p2, :cond_f

    iget-boolean p2, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->K:Z

    if-nez p2, :cond_f

    .line 3
    iput p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->G:I

    .line 4
    iput p3, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->H:I

    :cond_f
    return-void
.end method

.method public setShowMotionSpec(Lc/a/a/a/m/h;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->D:Lc/a/a/a/c0/f;

    invoke-interface {v0, p1}, Lc/a/a/a/c0/f;->a(Lc/a/a/a/m/h;)V

    return-void
.end method

.method public setShowMotionSpecResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lc/a/a/a/m/h;->a(Landroid/content/Context;I)Lc/a/a/a/m/h;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->setShowMotionSpec(Lc/a/a/a/m/h;)V

    return-void
.end method

.method public setShrinkMotionSpec(Lc/a/a/a/m/h;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->B:Lc/a/a/a/c0/f;

    invoke-interface {v0, p1}, Lc/a/a/a/c0/f;->a(Lc/a/a/a/m/h;)V

    return-void
.end method

.method public setShrinkMotionSpecResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lc/a/a/a/m/h;->a(Landroid/content/Context;I)Lc/a/a/a/m/h;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->setShrinkMotionSpec(Lc/a/a/a/m/h;)V

    return-void
.end method

.method public setTextColor(I)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/Button;->setTextColor(I)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->j()V

    return-void
.end method

.method public setTextColor(Landroid/content/res/ColorStateList;)V
    .registers 2

    .line 3
    invoke-super {p0, p1}, Landroid/widget/Button;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->j()V

    return-void
.end method
