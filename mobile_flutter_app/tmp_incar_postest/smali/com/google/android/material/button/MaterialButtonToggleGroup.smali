.class public Lcom/google/android/material/button/MaterialButtonToggleGroup;
.super Landroid/widget/LinearLayout;
.source "MaterialButtonToggleGroup.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/button/MaterialButtonToggleGroup$d;,
        Lcom/google/android/material/button/MaterialButtonToggleGroup$f;,
        Lcom/google/android/material/button/MaterialButtonToggleGroup$c;,
        Lcom/google/android/material/button/MaterialButtonToggleGroup$e;
    }
.end annotation


# static fields
.field public static final r:Ljava/lang/String;

.field public static final s:I


# instance fields
.field public final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/material/button/MaterialButtonToggleGroup$d;",
            ">;"
        }
    .end annotation
.end field

.field public final i:Lcom/google/android/material/button/MaterialButtonToggleGroup$c;

.field public final j:Lcom/google/android/material/button/MaterialButtonToggleGroup$f;

.field public final k:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Lcom/google/android/material/button/MaterialButtonToggleGroup$e;",
            ">;"
        }
    .end annotation
.end field

.field public final l:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/google/android/material/button/MaterialButton;",
            ">;"
        }
    .end annotation
.end field

.field public m:[Ljava/lang/Integer;

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    const-class v0, Lcom/google/android/material/button/MaterialButtonToggleGroup;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->r:Ljava/lang/String;

    .line 2
    sget v0, Lc/a/a/a/k;->Widget_MaterialComponents_MaterialButtonToggleGroup:I

    sput v0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->s:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lc/a/a/a/b;->materialButtonToggleGroupStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 10

    .line 3
    sget v0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->s:I

    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/q0/a/a;->b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->h:Ljava/util/List;

    .line 5
    new-instance p1, Lcom/google/android/material/button/MaterialButtonToggleGroup$c;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/google/android/material/button/MaterialButtonToggleGroup$c;-><init>(Lcom/google/android/material/button/MaterialButtonToggleGroup;Lcom/google/android/material/button/MaterialButtonToggleGroup$a;)V

    iput-object p1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->i:Lcom/google/android/material/button/MaterialButtonToggleGroup$c;

    .line 6
    new-instance p1, Lcom/google/android/material/button/MaterialButtonToggleGroup$f;

    invoke-direct {p1, p0, v0}, Lcom/google/android/material/button/MaterialButtonToggleGroup$f;-><init>(Lcom/google/android/material/button/MaterialButtonToggleGroup;Lcom/google/android/material/button/MaterialButtonToggleGroup$a;)V

    iput-object p1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->j:Lcom/google/android/material/button/MaterialButtonToggleGroup$f;

    .line 7
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->k:Ljava/util/LinkedHashSet;

    .line 8
    new-instance p1, Lcom/google/android/material/button/MaterialButtonToggleGroup$a;

    invoke-direct {p1, p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup$a;-><init>(Lcom/google/android/material/button/MaterialButtonToggleGroup;)V

    iput-object p1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->l:Ljava/util/Comparator;

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->n:Z

    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 11
    sget-object v2, Lc/a/a/a/l;->MaterialButtonToggleGroup:[I

    sget v4, Lcom/google/android/material/button/MaterialButtonToggleGroup;->s:I

    new-array v5, p1, [I

    move-object v1, p2

    move v3, p3

    .line 12
    invoke-static/range {v0 .. v5}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 13
    sget p3, Lc/a/a/a/l;->MaterialButtonToggleGroup_singleSelection:I

    .line 14
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    .line 15
    invoke-virtual {p0, p3}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->setSingleSelection(Z)V

    .line 16
    sget p3, Lc/a/a/a/l;->MaterialButtonToggleGroup_checkedButton:I

    const/4 v0, -0x1

    .line 17
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->q:I

    .line 18
    sget p3, Lc/a/a/a/l;->MaterialButtonToggleGroup_selectionRequired:I

    .line 19
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->p:Z

    const/4 p1, 0x1

    .line 20
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setChildrenDrawingOrderEnabled(Z)V

    .line 21
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 22
    invoke-static {p0, p1}, Lb/h/m/y;->h(Landroid/view/View;I)V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/button/MaterialButtonToggleGroup;I)I
    .registers 2

    .line 3
    iput p1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->q:I

    return p1
.end method

.method public static synthetic a(Lcom/google/android/material/button/MaterialButtonToggleGroup;Landroid/view/View;)I
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->b(Landroid/view/View;)I

    move-result p0

    return p0
.end method

.method public static a(Lc/a/a/a/l0/m$b;Lcom/google/android/material/button/MaterialButtonToggleGroup$d;)V
    .registers 3

    if-nez p1, :cond_7

    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/m$b;->a(F)Lc/a/a/a/l0/m$b;

    return-void

    .line 27
    :cond_7
    iget-object v0, p1, Lcom/google/android/material/button/MaterialButtonToggleGroup$d;->a:Lc/a/a/a/l0/c;

    .line 28
    invoke-virtual {p0, v0}, Lc/a/a/a/l0/m$b;->d(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    iget-object v0, p1, Lcom/google/android/material/button/MaterialButtonToggleGroup$d;->d:Lc/a/a/a/l0/c;

    .line 29
    invoke-virtual {p0, v0}, Lc/a/a/a/l0/m$b;->b(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    iget-object v0, p1, Lcom/google/android/material/button/MaterialButtonToggleGroup$d;->b:Lc/a/a/a/l0/c;

    .line 30
    invoke-virtual {p0, v0}, Lc/a/a/a/l0/m$b;->e(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    iget-object p1, p1, Lcom/google/android/material/button/MaterialButtonToggleGroup$d;->c:Lc/a/a/a/l0/c;

    .line 31
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/m$b;->c(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/button/MaterialButtonToggleGroup;)Z
    .registers 1

    .line 2
    iget-boolean p0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->n:Z

    return p0
.end method

.method public static synthetic a(Lcom/google/android/material/button/MaterialButtonToggleGroup;IZ)Z
    .registers 3

    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->d(IZ)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/google/android/material/button/MaterialButtonToggleGroup;IZ)V
    .registers 3

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->b(IZ)V

    return-void
.end method

.method public static synthetic b(Lcom/google/android/material/button/MaterialButtonToggleGroup;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->o:Z

    return p0
.end method

.method private getFirstVisibleChildIndex()I
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_11

    .line 2
    invoke-virtual {p0, v1}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->b(I)Z

    move-result v2

    if-eqz v2, :cond_e

    return v1

    :cond_e
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_11
    const/4 v0, -0x1

    return v0
.end method

.method private getLastVisibleChildIndex()I
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_6
    if-ltz v0, :cond_12

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->b(I)Z

    move-result v1

    if-eqz v1, :cond_f

    return v0

    :cond_f
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    :cond_12
    const/4 v0, -0x1

    return v0
.end method

.method private getVisibleButtonCount()I
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1
    :goto_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_1b

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Lcom/google/android/material/button/MaterialButton;

    if-eqz v2, :cond_18

    invoke-virtual {p0, v0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->b(I)Z

    move-result v2

    if-eqz v2, :cond_18

    add-int/lit8 v1, v1, 0x1

    :cond_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_1b
    return v1
.end method

.method private setCheckedId(I)V
    .registers 3

    .line 1
    iput p1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->q:I

    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->b(IZ)V

    return-void
.end method

.method private setGeneratedIdIfNeeded(Lcom/google/android/material/button/MaterialButton;)V
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/widget/Button;->getId()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_e

    .line 2
    invoke-static {}, Lb/h/m/y;->b()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setId(I)V

    :cond_e
    return-void
.end method

.method private setupButtonChild(Lcom/google/android/material/button/MaterialButton;)V
    .registers 4

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setMaxLines(I)V

    .line 2
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 3
    invoke-virtual {p1, v0}, Lcom/google/android/material/button/MaterialButton;->setCheckable(Z)V

    .line 4
    iget-object v1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->i:Lcom/google/android/material/button/MaterialButtonToggleGroup$c;

    invoke-virtual {p1, v1}, Lcom/google/android/material/button/MaterialButton;->a(Lcom/google/android/material/button/MaterialButton$a;)V

    .line 5
    iget-object v1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->j:Lcom/google/android/material/button/MaterialButtonToggleGroup$f;

    invoke-virtual {p1, v1}, Lcom/google/android/material/button/MaterialButton;->setOnPressedChangeListenerInternal(Lcom/google/android/material/button/MaterialButton$b;)V

    .line 6
    invoke-virtual {p1, v0}, Lcom/google/android/material/button/MaterialButton;->setShouldDrawSurfaceColorStroke(Z)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)Landroid/widget/LinearLayout$LayoutParams;
    .registers 4

    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    .line 35
    instance-of v0, p1, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v0, :cond_b

    .line 36
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    return-object p1

    .line 37
    :cond_b
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-direct {v0, v1, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public final a(I)Lcom/google/android/material/button/MaterialButton;
    .registers 2

    .line 21
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    return-object p1
.end method

.method public final a(III)Lcom/google/android/material/button/MaterialButtonToggleGroup$d;
    .registers 6

    .line 22
    iget-object v0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->h:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/button/MaterialButtonToggleGroup$d;

    if-ne p2, p3, :cond_b

    return-object v0

    .line 23
    :cond_b
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v1

    if-nez v1, :cond_13

    const/4 v1, 0x1

    goto :goto_14

    :cond_13
    const/4 v1, 0x0

    :goto_14
    if-ne p1, p2, :cond_22

    if-eqz v1, :cond_1d

    .line 24
    invoke-static {v0, p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup$d;->b(Lcom/google/android/material/button/MaterialButtonToggleGroup$d;Landroid/view/View;)Lcom/google/android/material/button/MaterialButtonToggleGroup$d;

    move-result-object p1

    goto :goto_21

    :cond_1d
    invoke-static {v0}, Lcom/google/android/material/button/MaterialButtonToggleGroup$d;->d(Lcom/google/android/material/button/MaterialButtonToggleGroup$d;)Lcom/google/android/material/button/MaterialButtonToggleGroup$d;

    move-result-object p1

    :goto_21
    return-object p1

    :cond_22
    if-ne p1, p3, :cond_30

    if-eqz v1, :cond_2b

    .line 25
    invoke-static {v0, p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup$d;->a(Lcom/google/android/material/button/MaterialButtonToggleGroup$d;Landroid/view/View;)Lcom/google/android/material/button/MaterialButtonToggleGroup$d;

    move-result-object p1

    goto :goto_2f

    :cond_2b
    invoke-static {v0}, Lcom/google/android/material/button/MaterialButtonToggleGroup$d;->a(Lcom/google/android/material/button/MaterialButtonToggleGroup$d;)Lcom/google/android/material/button/MaterialButtonToggleGroup$d;

    move-result-object p1

    :goto_2f
    return-object p1

    :cond_30
    const/4 p1, 0x0

    return-object p1
.end method

.method public final a()V
    .registers 8

    .line 6
    invoke-direct {p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->getFirstVisibleChildIndex()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_8

    return-void

    :cond_8
    add-int/lit8 v1, v0, 0x1

    .line 7
    :goto_a
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_49

    .line 8
    invoke-virtual {p0, v1}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->a(I)Lcom/google/android/material/button/MaterialButton;

    move-result-object v2

    add-int/lit8 v3, v1, -0x1

    .line 9
    invoke-virtual {p0, v3}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->a(I)Lcom/google/android/material/button/MaterialButton;

    move-result-object v3

    .line 10
    invoke-virtual {v2}, Lcom/google/android/material/button/MaterialButton;->getStrokeWidth()I

    move-result v4

    invoke-virtual {v3}, Lcom/google/android/material/button/MaterialButton;->getStrokeWidth()I

    move-result v3

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 11
    invoke-virtual {p0, v2}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->a(Landroid/view/View;)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v4

    .line 12
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v5

    const/4 v6, 0x0

    if-nez v5, :cond_3b

    .line 13
    invoke-static {v4, v6}, Lb/h/m/h;->a(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    neg-int v3, v3

    .line 14
    invoke-static {v4, v3}, Lb/h/m/h;->b(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    .line 15
    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    goto :goto_43

    .line 16
    :cond_3b
    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    neg-int v3, v3

    .line 17
    iput v3, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 18
    invoke-static {v4, v6}, Lb/h/m/h;->b(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    .line 19
    :goto_43
    invoke-virtual {v2, v4}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 20
    :cond_49
    invoke-virtual {p0, v0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->c(I)V

    return-void
.end method

.method public final a(IZ)V
    .registers 3

    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    if-eqz p1, :cond_b

    .line 33
    invoke-virtual {p1, p2}, Lcom/google/android/material/button/MaterialButton;->setChecked(Z)V

    :cond_b
    return-void
.end method

.method public a(Lcom/google/android/material/button/MaterialButtonToggleGroup$e;)V
    .registers 3

    .line 5
    iget-object v0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->k:Ljava/util/LinkedHashSet;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 8

    .line 1
    instance-of v0, p1, Lcom/google/android/material/button/MaterialButton;

    if-nez v0, :cond_c

    .line 2
    sget-object p1, Lcom/google/android/material/button/MaterialButtonToggleGroup;->r:Ljava/lang/String;

    const-string p2, "Child views must be of type MaterialButton."

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 3
    :cond_c
    invoke-super {p0, p1, p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 4
    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    .line 5
    invoke-direct {p0, p1}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->setGeneratedIdIfNeeded(Lcom/google/android/material/button/MaterialButton;)V

    .line 6
    invoke-direct {p0, p1}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->setupButtonChild(Lcom/google/android/material/button/MaterialButton;)V

    .line 7
    invoke-virtual {p1}, Lcom/google/android/material/button/MaterialButton;->isChecked()Z

    move-result p2

    if-eqz p2, :cond_2c

    .line 8
    invoke-virtual {p1}, Landroid/widget/Button;->getId()I

    move-result p2

    const/4 p3, 0x1

    invoke-virtual {p0, p2, p3}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->d(IZ)Z

    .line 9
    invoke-virtual {p1}, Landroid/widget/Button;->getId()I

    move-result p2

    invoke-direct {p0, p2}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->setCheckedId(I)V

    .line 10
    :cond_2c
    invoke-virtual {p1}, Lcom/google/android/material/button/MaterialButton;->getShapeAppearanceModel()Lc/a/a/a/l0/m;

    move-result-object p2

    .line 11
    iget-object p3, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->h:Ljava/util/List;

    new-instance v0, Lcom/google/android/material/button/MaterialButtonToggleGroup$d;

    .line 12
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->j()Lc/a/a/a/l0/c;

    move-result-object v1

    .line 13
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->c()Lc/a/a/a/l0/c;

    move-result-object v2

    .line 14
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->l()Lc/a/a/a/l0/c;

    move-result-object v3

    .line 15
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->e()Lc/a/a/a/l0/c;

    move-result-object p2

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/google/android/material/button/MaterialButtonToggleGroup$d;-><init>(Lc/a/a/a/l0/c;Lc/a/a/a/l0/c;Lc/a/a/a/l0/c;Lc/a/a/a/l0/c;)V

    .line 16
    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    new-instance p2, Lcom/google/android/material/button/MaterialButtonToggleGroup$b;

    invoke-direct {p2, p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup$b;-><init>(Lcom/google/android/material/button/MaterialButtonToggleGroup;)V

    invoke-static {p1, p2}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/a;)V

    return-void
.end method

.method public final b(Landroid/view/View;)I
    .registers 6

    .line 12
    instance-of v0, p1, Lcom/google/android/material/button/MaterialButton;

    const/4 v1, -0x1

    if-nez v0, :cond_6

    return v1

    :cond_6
    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 13
    :goto_8
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-ge v0, v3, :cond_28

    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    if-ne v3, p1, :cond_15

    return v2

    .line 15
    :cond_15
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v3, v3, Lcom/google/android/material/button/MaterialButton;

    if-eqz v3, :cond_25

    invoke-virtual {p0, v0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->b(I)Z

    move-result v3

    if-eqz v3, :cond_25

    add-int/lit8 v2, v2, 0x1

    :cond_25
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_28
    return v1
.end method

.method public b()V
    .registers 4

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->n:Z

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 4
    :goto_5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1c

    .line 5
    invoke-virtual {p0, v1}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->a(I)Lcom/google/android/material/button/MaterialButton;

    move-result-object v2

    .line 6
    invoke-virtual {v2, v0}, Lcom/google/android/material/button/MaterialButton;->setChecked(Z)V

    .line 7
    invoke-virtual {v2}, Landroid/widget/Button;->getId()I

    move-result v2

    invoke-virtual {p0, v2, v0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->b(IZ)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 8
    :cond_1c
    iput-boolean v0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->n:Z

    const/4 v0, -0x1

    .line 9
    invoke-direct {p0, v0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->setCheckedId(I)V

    return-void
.end method

.method public final b(IZ)V
    .registers 5

    .line 16
    iget-object v0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->k:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/button/MaterialButtonToggleGroup$e;

    .line 17
    invoke-interface {v1, p0, p1, p2}, Lcom/google/android/material/button/MaterialButtonToggleGroup$e;->a(Lcom/google/android/material/button/MaterialButtonToggleGroup;IZ)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final b(I)Z
    .registers 3

    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    const/16 v0, 0x8

    if-eq p1, v0, :cond_e

    const/4 p1, 0x1

    goto :goto_f

    :cond_e
    const/4 p1, 0x0

    :goto_f
    return p1
.end method

.method public final c(I)V
    .registers 5

    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-eqz v0, :cond_2b

    const/4 v0, -0x1

    if-ne p1, v0, :cond_a

    goto :goto_2b

    .line 8
    :cond_a
    invoke-virtual {p0, p1}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->a(I)Lcom/google/android/material/button/MaterialButton;

    move-result-object p1

    .line 9
    invoke-virtual {p1}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_21

    .line 11
    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 12
    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    return-void

    .line 13
    :cond_21
    invoke-static {p1, v2}, Lb/h/m/h;->a(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    .line 14
    invoke-static {p1, v2}, Lb/h/m/h;->b(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    .line 15
    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 16
    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    :cond_2b
    :goto_2b
    return-void
.end method

.method public final c(IZ)V
    .registers 4

    .line 2
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 3
    instance-of v0, p1, Lcom/google/android/material/button/MaterialButton;

    if-eqz v0, :cond_13

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->n:Z

    .line 5
    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1, p2}, Lcom/google/android/material/button/MaterialButton;->setChecked(Z)V

    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->n:Z

    :cond_13
    return-void
.end method

.method public c()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->o:Z

    return v0
.end method

.method public final d()V
    .registers 7

    .line 10
    new-instance v0, Ljava/util/TreeMap;

    iget-object v1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->l:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 11
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_d
    if-ge v3, v1, :cond_1d

    .line 12
    invoke-virtual {p0, v3}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->a(I)Lcom/google/android/material/button/MaterialButton;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 13
    :cond_1d
    invoke-interface {v0}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Integer;

    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Integer;

    iput-object v0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->m:[Ljava/lang/Integer;

    return-void
.end method

.method public final d(IZ)Z
    .registers 7

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->getCheckedButtonIds()Ljava/util/List;

    move-result-object v0

    .line 2
    iget-boolean v1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->p:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_16

    .line 3
    invoke-virtual {p0, p1, v2}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->c(IZ)V

    .line 4
    iput p1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->q:I

    return v3

    :cond_16
    if-eqz p2, :cond_3e

    .line 5
    iget-boolean p2, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->o:Z

    if-eqz p2, :cond_3e

    .line 6
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_27
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    .line 8
    invoke-virtual {p0, p2, v3}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->c(IZ)V

    .line 9
    invoke-virtual {p0, p2, v3}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->b(IZ)V

    goto :goto_27

    :cond_3e
    return v2
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->d()V

    .line 2
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public e()V
    .registers 8

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->getFirstVisibleChildIndex()I

    move-result v1

    .line 3
    invoke-direct {p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->getLastVisibleChildIndex()I

    move-result v2

    const/4 v3, 0x0

    :goto_d
    if-ge v3, v0, :cond_35

    .line 4
    invoke-virtual {p0, v3}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->a(I)Lcom/google/android/material/button/MaterialButton;

    move-result-object v4

    .line 5
    invoke-virtual {v4}, Landroid/widget/Button;->getVisibility()I

    move-result v5

    const/16 v6, 0x8

    if-ne v5, v6, :cond_1c

    goto :goto_32

    .line 6
    :cond_1c
    invoke-virtual {v4}, Lcom/google/android/material/button/MaterialButton;->getShapeAppearanceModel()Lc/a/a/a/l0/m;

    move-result-object v5

    invoke-virtual {v5}, Lc/a/a/a/l0/m;->m()Lc/a/a/a/l0/m$b;

    move-result-object v5

    .line 7
    invoke-virtual {p0, v3, v1, v2}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->a(III)Lcom/google/android/material/button/MaterialButtonToggleGroup$d;

    move-result-object v6

    .line 8
    invoke-static {v5, v6}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->a(Lc/a/a/a/l0/m$b;Lcom/google/android/material/button/MaterialButtonToggleGroup$d;)V

    .line 9
    invoke-virtual {v5}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/android/material/button/MaterialButton;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    :goto_32
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    :cond_35
    return-void
.end method

.method public getAccessibilityClassName()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    const-class v0, Lcom/google/android/material/button/MaterialButtonToggleGroup;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCheckedButtonId()I
    .registers 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->o:Z

    if-eqz v0, :cond_7

    iget v0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->q:I

    goto :goto_8

    :cond_7
    const/4 v0, -0x1

    :goto_8
    return v0
.end method

.method public getCheckedButtonIds()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 2
    :goto_6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_24

    .line 3
    invoke-virtual {p0, v1}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->a(I)Lcom/google/android/material/button/MaterialButton;

    move-result-object v2

    .line 4
    invoke-virtual {v2}, Lcom/google/android/material/button/MaterialButton;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_21

    .line 5
    invoke-virtual {v2}, Landroid/widget/Button;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_24
    return-object v0
.end method

.method public getChildDrawingOrder(II)I
    .registers 4

    .line 1
    iget-object p1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->m:[Ljava/lang/Integer;

    if-eqz p1, :cond_f

    array-length v0, p1

    if-lt p2, v0, :cond_8

    goto :goto_f

    .line 2
    :cond_8
    aget-object p1, p1, p2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    .line 3
    :cond_f
    :goto_f
    sget-object p1, Lcom/google/android/material/button/MaterialButtonToggleGroup;->r:Ljava/lang/String;

    const-string v0, "Child order wasn\'t updated"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return p2
.end method

.method public onFinishInflate()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    iget v0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->q:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_c

    const/4 v1, 0x1

    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->a(IZ)V

    :cond_c
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 6

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    invoke-static {p1}, Lb/h/m/h0/c;->a(Landroid/view/accessibility/AccessibilityNodeInfo;)Lb/h/m/h0/c;

    move-result-object p1

    .line 3
    invoke-direct {p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->getVisibleButtonCount()I

    move-result v0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->c()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_14

    const/4 v1, 0x1

    goto :goto_15

    :cond_14
    const/4 v1, 0x2

    :goto_15
    const/4 v3, 0x0

    .line 5
    invoke-static {v2, v0, v3, v1}, Lb/h/m/h0/c$b;->a(IIZI)Lb/h/m/h0/c$b;

    move-result-object v0

    .line 6
    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public onMeasure(II)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->e()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->a()V

    .line 3
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    return-void
.end method

.method public onViewRemoved(Landroid/view/View;)V
    .registers 4

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onViewRemoved(Landroid/view/View;)V

    .line 2
    instance-of v0, p1, Lcom/google/android/material/button/MaterialButton;

    if-eqz v0, :cond_13

    .line 3
    move-object v0, p1

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    iget-object v1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->i:Lcom/google/android/material/button/MaterialButtonToggleGroup$c;

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->b(Lcom/google/android/material/button/MaterialButton$a;)V

    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setOnPressedChangeListenerInternal(Lcom/google/android/material/button/MaterialButton$b;)V

    .line 5
    :cond_13
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result p1

    if-ltz p1, :cond_1e

    .line 6
    iget-object v0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->h:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    :cond_1e
    invoke-virtual {p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->e()V

    .line 8
    invoke-virtual {p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->a()V

    return-void
.end method

.method public setSelectionRequired(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->p:Z

    return-void
.end method

.method public setSingleSelection(I)V
    .registers 3

    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->setSingleSelection(Z)V

    return-void
.end method

.method public setSingleSelection(Z)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->o:Z

    if-eq v0, p1, :cond_9

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/button/MaterialButtonToggleGroup;->o:Z

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->b()V

    :cond_9
    return-void
.end method
