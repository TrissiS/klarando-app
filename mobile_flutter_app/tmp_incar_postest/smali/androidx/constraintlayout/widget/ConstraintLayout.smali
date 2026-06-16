.class public Landroidx/constraintlayout/widget/ConstraintLayout;
.super Landroid/view/ViewGroup;
.source "ConstraintLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;,
        Landroidx/constraintlayout/widget/ConstraintLayout$b;
    }
.end annotation


# instance fields
.field public h:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/widget/ConstraintHelper;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lb/f/b/k/f;

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:Z

.field public p:I

.field public q:Lb/f/c/c;

.field public r:Lb/f/c/b;

.field public s:I

.field public t:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public u:I

.field public v:I

.field public w:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lb/f/b/k/e;",
            ">;"
        }
    .end annotation
.end field

.field public x:Landroidx/constraintlayout/widget/ConstraintLayout$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    .line 1
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->h:Landroid/util/SparseArray;

    .line 3
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->i:Ljava/util/ArrayList;

    .line 4
    new-instance p1, Lb/f/b/k/f;

    invoke-direct {p1}, Lb/f/b/k/f;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    const/4 p1, 0x0

    .line 5
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:I

    .line 6
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:I

    const v0, 0x7fffffff

    .line 7
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    .line 8
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:Z

    const/16 v0, 0x107

    .line 10
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Lb/f/c/c;

    .line 12
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->r:Lb/f/c/b;

    const/4 v1, -0x1

    .line 13
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->s:I

    .line 14
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->t:Ljava/util/HashMap;

    .line 15
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->u:I

    .line 16
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->v:I

    .line 17
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->w:Landroid/util/SparseArray;

    .line 18
    new-instance v1, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    invoke-direct {v1, p0, p0}, Landroidx/constraintlayout/widget/ConstraintLayout$b;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    iput-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->x:Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 19
    invoke-virtual {p0, v0, p1, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5

    .line 20
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->h:Landroid/util/SparseArray;

    .line 22
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->i:Ljava/util/ArrayList;

    .line 23
    new-instance p1, Lb/f/b/k/f;

    invoke-direct {p1}, Lb/f/b/k/f;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    const/4 p1, 0x0

    .line 24
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:I

    .line 25
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:I

    const v0, 0x7fffffff

    .line 26
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    .line 27
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:Z

    const/16 v0, 0x107

    .line 29
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Lb/f/c/c;

    .line 31
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->r:Lb/f/c/b;

    const/4 v0, -0x1

    .line 32
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->s:I

    .line 33
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->t:Ljava/util/HashMap;

    .line 34
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->u:I

    .line 35
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->v:I

    .line 36
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->w:Landroid/util/SparseArray;

    .line 37
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    invoke-direct {v0, p0, p0}, Landroidx/constraintlayout/widget/ConstraintLayout$b;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->x:Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 38
    invoke-virtual {p0, p2, p1, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6

    .line 39
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->h:Landroid/util/SparseArray;

    .line 41
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->i:Ljava/util/ArrayList;

    .line 42
    new-instance p1, Lb/f/b/k/f;

    invoke-direct {p1}, Lb/f/b/k/f;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    const/4 p1, 0x0

    .line 43
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:I

    .line 44
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:I

    const v0, 0x7fffffff

    .line 45
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    .line 46
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    const/4 v0, 0x1

    .line 47
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:Z

    const/16 v0, 0x107

    .line 48
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    const/4 v0, 0x0

    .line 49
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Lb/f/c/c;

    .line 50
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->r:Lb/f/c/b;

    const/4 v0, -0x1

    .line 51
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->s:I

    .line 52
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->t:Ljava/util/HashMap;

    .line 53
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->u:I

    .line 54
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->v:I

    .line 55
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->w:Landroid/util/SparseArray;

    .line 56
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    invoke-direct {v0, p0, p0}, Landroidx/constraintlayout/widget/ConstraintLayout$b;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->x:Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 57
    invoke-virtual {p0, p2, p3, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 58
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 59
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->h:Landroid/util/SparseArray;

    .line 60
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->i:Ljava/util/ArrayList;

    .line 61
    new-instance p1, Lb/f/b/k/f;

    invoke-direct {p1}, Lb/f/b/k/f;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    const/4 p1, 0x0

    .line 62
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:I

    .line 63
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:I

    const p1, 0x7fffffff

    .line 64
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    .line 65
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    const/4 p1, 0x1

    .line 66
    iput-boolean p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:Z

    const/16 p1, 0x107

    .line 67
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    const/4 p1, 0x0

    .line 68
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Lb/f/c/c;

    .line 69
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->r:Lb/f/c/b;

    const/4 p1, -0x1

    .line 70
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->s:I

    .line 71
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->t:Ljava/util/HashMap;

    .line 72
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->u:I

    .line 73
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->v:I

    .line 74
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->w:Landroid/util/SparseArray;

    .line 75
    new-instance p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    invoke-direct {p1, p0, p0}, Landroidx/constraintlayout/widget/ConstraintLayout$b;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->x:Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 76
    invoke-virtual {p0, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static synthetic a(Landroidx/constraintlayout/widget/ConstraintLayout;)Ljava/util/ArrayList;
    .registers 1

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->i:Ljava/util/ArrayList;

    return-object p0
.end method

.method private getPaddingWidth()I
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 2
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-lt v2, v3, :cond_29

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingStart()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingEnd()I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    add-int/2addr v1, v2

    :cond_29
    if-lez v1, :cond_2c

    move v0, v1

    :cond_2c
    return v0
.end method


# virtual methods
.method public final a(I)Lb/f/b/k/e;
    .registers 3

    if-nez p1, :cond_5

    .line 160
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    return-object p1

    .line 161
    :cond_5
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->h:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_20

    .line 162
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_20

    if-eq v0, p0, :cond_20

    .line 163
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-ne p1, p0, :cond_20

    .line 164
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;->onViewAdded(Landroid/view/View;)V

    :cond_20
    if-ne v0, p0, :cond_25

    .line 165
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    return-object p1

    :cond_25
    if-nez v0, :cond_29

    const/4 p1, 0x0

    goto :goto_31

    .line 166
    :cond_29
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    iget-object p1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m0:Lb/f/b/k/e;

    :goto_31
    return-object p1
.end method

.method public final a(Landroid/view/View;)Lb/f/b/k/e;
    .registers 2

    if-ne p1, p0, :cond_5

    .line 167
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    return-object p1

    :cond_5
    if-nez p1, :cond_9

    const/4 p1, 0x0

    goto :goto_11

    .line 168
    :cond_9
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    iget-object p1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m0:Lb/f/b/k/e;

    :goto_11
    return-object p1
.end method

.method public a(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 3

    if-nez p1, :cond_19

    .line 10
    instance-of p1, p2, Ljava/lang/String;

    if-eqz p1, :cond_19

    .line 11
    check-cast p2, Ljava/lang/String;

    .line 12
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->t:Ljava/util/HashMap;

    if-eqz p1, :cond_19

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_19

    .line 13
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->t:Ljava/util/HashMap;

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_19
    const/4 p1, 0x0

    return-object p1
.end method

.method public a(IIIIZZ)V
    .registers 9

    .line 185
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->x:Landroidx/constraintlayout/widget/ConstraintLayout$b;

    iget v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->e:I

    .line 186
    iget v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->d:I

    add-int/2addr p3, v0

    add-int/2addr p4, v1

    .line 187
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_38

    const/4 v0, 0x0

    .line 188
    invoke-static {p3, p1, v0}, Landroid/view/ViewGroup;->resolveSizeAndState(III)I

    move-result p1

    .line 189
    invoke-static {p4, p2, v0}, Landroid/view/ViewGroup;->resolveSizeAndState(III)I

    move-result p2

    const p3, 0xffffff

    and-int/2addr p1, p3

    and-int/2addr p2, p3

    .line 190
    iget p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    invoke-static {p3, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 191
    iget p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    invoke-static {p3, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    const/high16 p3, 0x1000000

    if-eqz p5, :cond_2d

    or-int/2addr p1, p3

    :cond_2d
    if-eqz p6, :cond_30

    or-int/2addr p2, p3

    .line 192
    :cond_30
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 193
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->u:I

    .line 194
    iput p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->v:I

    goto :goto_3f

    .line 195
    :cond_38
    invoke-virtual {p0, p3, p4}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 196
    iput p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->u:I

    .line 197
    iput p4, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->v:I

    :goto_3f
    return-void
.end method

.method public a(ILjava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    if-nez p1, :cond_35

    .line 2
    instance-of p1, p2, Ljava/lang/String;

    if-eqz p1, :cond_35

    instance-of p1, p3, Ljava/lang/Integer;

    if-eqz p1, :cond_35

    .line 3
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->t:Ljava/util/HashMap;

    if-nez p1, :cond_15

    .line 4
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->t:Ljava/util/HashMap;

    .line 5
    :cond_15
    check-cast p2, Ljava/lang/String;

    const-string p1, "/"

    .line 6
    invoke-virtual {p2, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_26

    add-int/lit8 p1, p1, 0x1

    .line 7
    invoke-virtual {p2, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    .line 8
    :cond_26
    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 9
    iget-object p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->t:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p3, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_35
    return-void
.end method

.method public final a(Landroid/util/AttributeSet;II)V
    .registers 9

    .line 14
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {v0, p0}, Lb/f/b/k/e;->a(Ljava/lang/Object;)V

    .line 15
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->x:Landroidx/constraintlayout/widget/ConstraintLayout$b;

    invoke-virtual {v0, v1}, Lb/f/b/k/f;->a(Lb/f/b/k/n/b$b;)V

    .line 16
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->h:Landroid/util/SparseArray;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getId()I

    move-result v1

    invoke-virtual {v0, v1, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Lb/f/c/c;

    if-eqz p1, :cond_a3

    .line 18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lb/f/c/f;->ConstraintLayout_Layout:[I

    invoke-virtual {v1, p1, v2, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 19
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result p2

    const/4 p3, 0x0

    const/4 v1, 0x0

    :goto_2a
    if-ge v1, p2, :cond_a0

    .line 20
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v2

    .line 21
    sget v3, Lb/f/c/f;->ConstraintLayout_Layout_android_minWidth:I

    if-ne v2, v3, :cond_3d

    .line 22
    iget v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:I

    goto :goto_9d

    .line 23
    :cond_3d
    sget v3, Lb/f/c/f;->ConstraintLayout_Layout_android_minHeight:I

    if-ne v2, v3, :cond_4a

    .line 24
    iget v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:I

    goto :goto_9d

    .line 25
    :cond_4a
    sget v3, Lb/f/c/f;->ConstraintLayout_Layout_android_maxWidth:I

    if-ne v2, v3, :cond_57

    .line 26
    iget v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    goto :goto_9d

    .line 27
    :cond_57
    sget v3, Lb/f/c/f;->ConstraintLayout_Layout_android_maxHeight:I

    if-ne v2, v3, :cond_64

    .line 28
    iget v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    goto :goto_9d

    .line 29
    :cond_64
    sget v3, Lb/f/c/f;->ConstraintLayout_Layout_layout_optimizationLevel:I

    if-ne v2, v3, :cond_71

    .line 30
    iget v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    goto :goto_9d

    .line 31
    :cond_71
    sget v3, Lb/f/c/f;->ConstraintLayout_Layout_layoutDescription:I

    if-ne v2, v3, :cond_82

    .line 32
    invoke-virtual {p1, v2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    if-eqz v2, :cond_9d

    .line 33
    :try_start_7b
    invoke-virtual {p0, v2}, Landroidx/constraintlayout/widget/ConstraintLayout;->c(I)V
    :try_end_7e
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_7b .. :try_end_7e} :catch_7f

    goto :goto_9d

    .line 34
    :catch_7f
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->r:Lb/f/c/b;

    goto :goto_9d

    .line 35
    :cond_82
    sget v3, Lb/f/c/f;->ConstraintLayout_Layout_constraintSet:I

    if-ne v2, v3, :cond_9d

    .line 36
    invoke-virtual {p1, v2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 37
    :try_start_8a
    new-instance v3, Lb/f/c/c;

    invoke-direct {v3}, Lb/f/c/c;-><init>()V

    iput-object v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Lb/f/c/c;

    .line 38
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Lb/f/c/c;->b(Landroid/content/Context;I)V
    :try_end_98
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_8a .. :try_end_98} :catch_99

    goto :goto_9b

    .line 39
    :catch_99
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Lb/f/c/c;

    .line 40
    :goto_9b
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->s:I

    :cond_9d
    :goto_9d
    add-int/lit8 v1, v1, 0x1

    goto :goto_2a

    .line 41
    :cond_a0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 42
    :cond_a3
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    iget p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    invoke-virtual {p1, p2}, Lb/f/b/k/f;->u(I)V

    return-void
.end method

.method public a(Lb/f/b/k/f;III)V
    .registers 25

    move-object/from16 v6, p0

    .line 169
    invoke-static/range {p3 .. p3}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v9

    .line 170
    invoke-static/range {p3 .. p3}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 171
    invoke-static/range {p4 .. p4}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v11

    .line 172
    invoke-static/range {p4 .. p4}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 173
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v19

    .line 174
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v2

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v16

    add-int v2, v19, v16

    .line 175
    invoke-direct/range {p0 .. p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->getPaddingWidth()I

    move-result v4

    .line 176
    iget-object v12, v6, Landroidx/constraintlayout/widget/ConstraintLayout;->x:Landroidx/constraintlayout/widget/ConstraintLayout$b;

    move/from16 v13, p3

    move/from16 v14, p4

    move/from16 v15, v19

    move/from16 v17, v4

    move/from16 v18, v2

    invoke-virtual/range {v12 .. v18}, Landroidx/constraintlayout/widget/ConstraintLayout$b;->a(IIIIII)V

    .line 177
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x11

    if-lt v5, v7, :cond_65

    .line 178
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingStart()I

    move-result v5

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 179
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingEnd()I

    move-result v7

    invoke-static {v3, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    if-gtz v5, :cond_5c

    if-lez v7, :cond_53

    goto :goto_5c

    .line 180
    :cond_53
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v5

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    goto :goto_63

    .line 181
    :cond_5c
    :goto_5c
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->a()Z

    move-result v3

    if-eqz v3, :cond_63

    move v5, v7

    :cond_63
    :goto_63
    move v15, v5

    goto :goto_6e

    .line 182
    :cond_65
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v5

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    move v15, v3

    :goto_6e
    sub-int v10, v0, v4

    sub-int v12, v1, v2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v2, v9

    move v3, v10

    move v4, v11

    move v5, v12

    .line 183
    invoke-virtual/range {v0 .. v5}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Lb/f/b/k/f;IIII)V

    .line 184
    iget v13, v6, Landroidx/constraintlayout/widget/ConstraintLayout;->u:I

    iget v14, v6, Landroidx/constraintlayout/widget/ConstraintLayout;->v:I

    move-object/from16 v7, p1

    move/from16 v8, p2

    move/from16 v16, v19

    invoke-virtual/range {v7 .. v16}, Lb/f/b/k/f;->a(IIIIIIIII)J

    return-void
.end method

.method public a(Lb/f/b/k/f;IIII)V
    .registers 13

    .line 201
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->x:Landroidx/constraintlayout/widget/ConstraintLayout$b;

    iget v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->e:I

    .line 202
    iget v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->d:I

    .line 203
    sget-object v2, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    .line 204
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    const/high16 v5, -0x80000000

    const/4 v6, 0x0

    if-eq p2, v5, :cond_2e

    if-eqz p2, :cond_23

    if-eq p2, v4, :cond_1a

    move-object p2, v2

    :cond_18
    const/4 p3, 0x0

    goto :goto_38

    .line 205
    :cond_1a
    iget p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    sub-int/2addr p2, v0

    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    move-result p3

    move-object p2, v2

    goto :goto_38

    .line 206
    :cond_23
    sget-object p2, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-nez v3, :cond_18

    .line 207
    iget p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:I

    invoke-static {v6, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    goto :goto_38

    .line 208
    :cond_2e
    sget-object p2, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-nez v3, :cond_38

    .line 209
    iget p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:I

    invoke-static {v6, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    :cond_38
    :goto_38
    if-eq p4, v5, :cond_53

    if-eqz p4, :cond_48

    if-eq p4, v4, :cond_40

    :cond_3e
    const/4 p5, 0x0

    goto :goto_5d

    .line 210
    :cond_40
    iget p4, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    sub-int/2addr p4, v1

    invoke-static {p4, p5}, Ljava/lang/Math;->min(II)I

    move-result p5

    goto :goto_5d

    .line 211
    :cond_48
    sget-object v2, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-nez v3, :cond_3e

    .line 212
    iget p4, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:I

    invoke-static {v6, p4}, Ljava/lang/Math;->max(II)I

    move-result p5

    goto :goto_5d

    .line 213
    :cond_53
    sget-object v2, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-nez v3, :cond_5d

    .line 214
    iget p4, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:I

    invoke-static {v6, p4}, Ljava/lang/Math;->max(II)I

    move-result p5

    .line 215
    :cond_5d
    :goto_5d
    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result p4

    if-ne p3, p4, :cond_69

    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result p4

    if-eq p5, p4, :cond_6c

    .line 216
    :cond_69
    invoke-virtual {p1}, Lb/f/b/k/f;->Q()V

    .line 217
    :cond_6c
    invoke-virtual {p1, v6}, Lb/f/b/k/e;->r(I)V

    .line 218
    invoke-virtual {p1, v6}, Lb/f/b/k/e;->s(I)V

    .line 219
    iget p4, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    sub-int/2addr p4, v0

    invoke-virtual {p1, p4}, Lb/f/b/k/e;->l(I)V

    .line 220
    iget p4, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    sub-int/2addr p4, v1

    invoke-virtual {p1, p4}, Lb/f/b/k/e;->k(I)V

    .line 221
    invoke-virtual {p1, v6}, Lb/f/b/k/e;->n(I)V

    .line 222
    invoke-virtual {p1, v6}, Lb/f/b/k/e;->m(I)V

    .line 223
    invoke-virtual {p1, p2}, Lb/f/b/k/e;->a(Lb/f/b/k/e$b;)V

    .line 224
    invoke-virtual {p1, p3}, Lb/f/b/k/e;->q(I)V

    .line 225
    invoke-virtual {p1, v2}, Lb/f/b/k/e;->b(Lb/f/b/k/e$b;)V

    .line 226
    invoke-virtual {p1, p5}, Lb/f/b/k/e;->i(I)V

    .line 227
    iget p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:I

    sub-int/2addr p2, v0

    invoke-virtual {p1, p2}, Lb/f/b/k/e;->n(I)V

    .line 228
    iget p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:I

    sub-int/2addr p2, v1

    invoke-virtual {p1, p2}, Lb/f/b/k/e;->m(I)V

    return-void
.end method

.method public a(ZLandroid/view/View;Lb/f/b/k/e;Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;Landroid/util/SparseArray;)V
    .registers 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Landroid/view/View;",
            "Lb/f/b/k/e;",
            "Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;",
            "Landroid/util/SparseArray<",
            "Lb/f/b/k/e;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    move-object/from16 v9, p5

    .line 43
    invoke-virtual/range {p4 .. p4}, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c()V

    const/4 v10, 0x0

    .line 44
    iput-boolean v10, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->n0:Z

    .line 45
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getVisibility()I

    move-result v2

    invoke-virtual {v7, v2}, Lb/f/b/k/e;->p(I)V

    .line 46
    iget-boolean v2, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a0:Z

    const/4 v11, 0x1

    if-eqz v2, :cond_24

    .line 47
    invoke-virtual {v7, v11}, Lb/f/b/k/e;->b(Z)V

    const/16 v2, 0x8

    .line 48
    invoke-virtual {v7, v2}, Lb/f/b/k/e;->p(I)V

    .line 49
    :cond_24
    invoke-virtual {v7, v1}, Lb/f/b/k/e;->a(Ljava/lang/Object;)V

    .line 50
    instance-of v2, v1, Landroidx/constraintlayout/widget/ConstraintHelper;

    if-eqz v2, :cond_36

    .line 51
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 52
    iget-object v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {v2}, Lb/f/b/k/f;->S()Z

    move-result v2

    invoke-virtual {v1, v7, v2}, Landroidx/constraintlayout/widget/ConstraintHelper;->a(Lb/f/b/k/e;Z)V

    .line 53
    :cond_36
    iget-boolean v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Y:Z

    const/16 v2, 0x11

    const/4 v12, -0x1

    if-eqz v1, :cond_69

    .line 54
    move-object v1, v7

    check-cast v1, Lb/f/b/k/h;

    .line 55
    iget v3, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->j0:I

    .line 56
    iget v4, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->k0:I

    .line 57
    iget v5, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->l0:F

    .line 58
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v6, v2, :cond_50

    .line 59
    iget v3, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a:I

    .line 60
    iget v4, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->b:I

    .line 61
    iget v5, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c:F

    :cond_50
    const/high16 v2, -0x40800000    # -1.0f

    cmpl-float v2, v5, v2

    if-eqz v2, :cond_5b

    .line 62
    invoke-virtual {v1, v5}, Lb/f/b/k/h;->e(F)V

    goto/16 :goto_2d1

    :cond_5b
    if-eq v3, v12, :cond_62

    .line 63
    invoke-virtual {v1, v3}, Lb/f/b/k/h;->t(I)V

    goto/16 :goto_2d1

    :cond_62
    if-eq v4, v12, :cond_2d1

    .line 64
    invoke-virtual {v1, v4}, Lb/f/b/k/h;->u(I)V

    goto/16 :goto_2d1

    .line 65
    :cond_69
    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->c0:I

    .line 66
    iget v3, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d0:I

    .line 67
    iget v4, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e0:I

    .line 68
    iget v5, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f0:I

    .line 69
    iget v6, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g0:I

    .line 70
    iget v13, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h0:I

    .line 71
    iget v14, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->i0:F

    .line 72
    sget v15, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v15, v2, :cond_b1

    .line 73
    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->d:I

    .line 74
    iget v2, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->e:I

    .line 75
    iget v4, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->f:I

    .line 76
    iget v5, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->g:I

    .line 77
    iget v3, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->t:I

    .line 78
    iget v6, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->v:I

    .line 79
    iget v14, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->z:F

    if-ne v1, v12, :cond_98

    if-ne v2, v12, :cond_98

    .line 80
    iget v13, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->q:I

    if-eq v13, v12, :cond_93

    move v1, v13

    goto :goto_98

    .line 81
    :cond_93
    iget v13, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->p:I

    if-eq v13, v12, :cond_98

    move v2, v13

    :cond_98
    :goto_98
    if-ne v4, v12, :cond_ac

    if-ne v5, v12, :cond_ac

    .line 82
    iget v13, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->r:I

    if-eq v13, v12, :cond_a1

    goto :goto_ad

    .line 83
    :cond_a1
    iget v13, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->s:I

    if-eq v13, v12, :cond_ac

    move v15, v6

    move v5, v14

    move v6, v3

    move v14, v13

    move v3, v2

    move v13, v4

    goto :goto_b8

    :cond_ac
    move v13, v4

    :goto_ad
    move v15, v6

    move v6, v3

    move v3, v2

    goto :goto_b3

    :cond_b1
    move v15, v13

    move v13, v4

    :goto_b3
    move/from16 v18, v14

    move v14, v5

    move/from16 v5, v18

    .line 84
    :goto_b8
    iget v2, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m:I

    if-eq v2, v12, :cond_cd

    .line 85
    invoke-virtual {v9, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/e;

    if-eqz v1, :cond_200

    .line 86
    iget v2, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->o:F

    iget v3, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->n:I

    invoke-virtual {v7, v1, v2, v3}, Lb/f/b/k/e;->a(Lb/f/b/k/e;FI)V

    goto/16 :goto_200

    :cond_cd
    if-eq v1, v12, :cond_ec

    .line 87
    invoke-virtual {v9, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lb/f/b/k/e;

    if-eqz v3, :cond_e9

    .line 88
    sget-object v4, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    iget v2, v8, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    move-object/from16 v1, p3

    move/from16 v16, v2

    move-object v2, v4

    move/from16 v17, v5

    move/from16 v5, v16

    invoke-virtual/range {v1 .. v6}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;II)V

    goto :goto_104

    :cond_e9
    move/from16 v17, v5

    goto :goto_104

    :cond_ec
    move/from16 v17, v5

    if-eq v3, v12, :cond_104

    .line 89
    invoke-virtual {v9, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lb/f/b/k/e;

    if-eqz v3, :cond_104

    .line 90
    sget-object v2, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    sget-object v4, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    iget v5, v8, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    move-object/from16 v1, p3

    invoke-virtual/range {v1 .. v6}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;II)V

    :cond_104
    :goto_104
    if-eq v13, v12, :cond_11c

    .line 91
    invoke-virtual {v9, v13}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lb/f/b/k/e;

    if-eqz v3, :cond_132

    .line 92
    sget-object v2, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    sget-object v4, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    iget v5, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    move-object/from16 v1, p3

    move v6, v15

    invoke-virtual/range {v1 .. v6}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;II)V

    goto :goto_132

    :cond_11c
    if-eq v14, v12, :cond_132

    .line 93
    invoke-virtual {v9, v14}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lb/f/b/k/e;

    if-eqz v3, :cond_132

    .line 94
    sget-object v4, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    iget v5, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    move-object/from16 v1, p3

    move-object v2, v4

    move v6, v15

    invoke-virtual/range {v1 .. v6}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;II)V

    .line 95
    :cond_132
    :goto_132
    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->h:I

    if-eq v1, v12, :cond_14c

    .line 96
    invoke-virtual {v9, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lb/f/b/k/e;

    if-eqz v3, :cond_166

    .line 97
    sget-object v4, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    iget v5, v8, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v6, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->u:I

    move-object/from16 v1, p3

    move-object v2, v4

    invoke-virtual/range {v1 .. v6}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;II)V

    goto :goto_166

    .line 98
    :cond_14c
    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->i:I

    if-eq v1, v12, :cond_166

    .line 99
    invoke-virtual {v9, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lb/f/b/k/e;

    if-eqz v3, :cond_166

    .line 100
    sget-object v2, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    sget-object v4, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    iget v5, v8, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v6, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->u:I

    move-object/from16 v1, p3

    invoke-virtual/range {v1 .. v6}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;II)V

    .line 101
    :cond_166
    :goto_166
    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->j:I

    if-eq v1, v12, :cond_181

    .line 102
    invoke-virtual {v9, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lb/f/b/k/e;

    if-eqz v3, :cond_19a

    .line 103
    sget-object v2, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    sget-object v4, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    iget v5, v8, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iget v6, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->w:I

    move-object/from16 v1, p3

    invoke-virtual/range {v1 .. v6}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;II)V

    goto :goto_19a

    .line 104
    :cond_181
    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->k:I

    if-eq v1, v12, :cond_19a

    .line 105
    invoke-virtual {v9, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lb/f/b/k/e;

    if-eqz v3, :cond_19a

    .line 106
    sget-object v4, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    iget v5, v8, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iget v6, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->w:I

    move-object/from16 v1, p3

    move-object v2, v4

    invoke-virtual/range {v1 .. v6}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;Lb/f/b/k/e;Lb/f/b/k/d$b;II)V

    .line 107
    :cond_19a
    :goto_19a
    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->l:I

    if-eq v1, v12, :cond_1ed

    .line 108
    iget-object v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->h:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 109
    iget v2, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->l:I

    invoke-virtual {v9, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/e;

    if-eqz v2, :cond_1ed

    if-eqz v1, :cond_1ed

    .line 110
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    instance-of v3, v3, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    if-eqz v3, :cond_1ed

    .line 111
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 112
    iput-boolean v11, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->X:Z

    .line 113
    iput-boolean v11, v1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->X:Z

    .line 114
    sget-object v3, Lb/f/b/k/d$b;->BASELINE:Lb/f/b/k/d$b;

    invoke-virtual {v7, v3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v3

    .line 115
    sget-object v4, Lb/f/b/k/d$b;->BASELINE:Lb/f/b/k/d$b;

    .line 116
    invoke-virtual {v2, v4}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v2

    .line 117
    invoke-virtual {v3, v2, v10, v12, v11}, Lb/f/b/k/d;->a(Lb/f/b/k/d;IIZ)Z

    .line 118
    invoke-virtual {v7, v11}, Lb/f/b/k/e;->a(Z)V

    .line 119
    iget-object v1, v1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m0:Lb/f/b/k/e;

    invoke-virtual {v1, v11}, Lb/f/b/k/e;->a(Z)V

    .line 120
    sget-object v1, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v1

    invoke-virtual {v1}, Lb/f/b/k/d;->i()V

    .line 121
    sget-object v1, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v1

    invoke-virtual {v1}, Lb/f/b/k/d;->i()V

    :cond_1ed
    const/4 v1, 0x0

    move/from16 v14, v17

    cmpl-float v2, v14, v1

    if-ltz v2, :cond_1f7

    .line 122
    invoke-virtual {v7, v14}, Lb/f/b/k/e;->a(F)V

    .line 123
    :cond_1f7
    iget v2, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->A:F

    cmpl-float v1, v2, v1

    if-ltz v1, :cond_200

    .line 124
    invoke-virtual {v7, v2}, Lb/f/b/k/e;->c(F)V

    :cond_200
    :goto_200
    if-eqz p1, :cond_211

    .line 125
    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->P:I

    if-ne v1, v12, :cond_20a

    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Q:I

    if-eq v1, v12, :cond_211

    .line 126
    :cond_20a
    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->P:I

    iget v2, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Q:I

    invoke-virtual {v7, v1, v2}, Lb/f/b/k/e;->b(II)V

    .line 127
    :cond_211
    iget-boolean v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->V:Z

    const/4 v2, -0x2

    if-nez v1, :cond_247

    .line 128
    iget v1, v8, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    if-ne v1, v12, :cond_23e

    .line 129
    iget-boolean v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->S:Z

    if-eqz v1, :cond_224

    .line 130
    sget-object v1, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/e$b;)V

    goto :goto_229

    .line 131
    :cond_224
    sget-object v1, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/e$b;)V

    .line 132
    :goto_229
    sget-object v1, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v1

    iget v3, v8, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v3, v1, Lb/f/b/k/d;->e:I

    .line 133
    sget-object v1, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v1

    iget v3, v8, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iput v3, v1, Lb/f/b/k/d;->e:I

    goto :goto_25a

    .line 134
    :cond_23e
    sget-object v1, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/e$b;)V

    .line 135
    invoke-virtual {v7, v10}, Lb/f/b/k/e;->q(I)V

    goto :goto_25a

    .line 136
    :cond_247
    sget-object v1, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/e$b;)V

    .line 137
    iget v1, v8, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->q(I)V

    .line 138
    iget v1, v8, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    if-ne v1, v2, :cond_25a

    .line 139
    sget-object v1, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/e$b;)V

    .line 140
    :cond_25a
    :goto_25a
    iget-boolean v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->W:Z

    if-nez v1, :cond_28f

    .line 141
    iget v1, v8, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    if-ne v1, v12, :cond_286

    .line 142
    iget-boolean v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->T:Z

    if-eqz v1, :cond_26c

    .line 143
    sget-object v1, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->b(Lb/f/b/k/e$b;)V

    goto :goto_271

    .line 144
    :cond_26c
    sget-object v1, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->b(Lb/f/b/k/e$b;)V

    .line 145
    :goto_271
    sget-object v1, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v1

    iget v2, v8, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v2, v1, Lb/f/b/k/d;->e:I

    .line 146
    sget-object v1, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v1

    iget v2, v8, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iput v2, v1, Lb/f/b/k/d;->e:I

    goto :goto_2a2

    .line 147
    :cond_286
    sget-object v1, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->b(Lb/f/b/k/e$b;)V

    .line 148
    invoke-virtual {v7, v10}, Lb/f/b/k/e;->i(I)V

    goto :goto_2a2

    .line 149
    :cond_28f
    sget-object v1, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->b(Lb/f/b/k/e$b;)V

    .line 150
    iget v1, v8, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->i(I)V

    .line 151
    iget v1, v8, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    if-ne v1, v2, :cond_2a2

    .line 152
    sget-object v1, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->b(Lb/f/b/k/e$b;)V

    .line 153
    :cond_2a2
    :goto_2a2
    iget-object v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->B:Ljava/lang/String;

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->b(Ljava/lang/String;)V

    .line 154
    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->D:F

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->b(F)V

    .line 155
    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->E:F

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->d(F)V

    .line 156
    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->F:I

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->j(I)V

    .line 157
    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->G:I

    invoke-virtual {v7, v1}, Lb/f/b/k/e;->o(I)V

    .line 158
    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->H:I

    iget v2, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->J:I

    iget v3, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->L:I

    iget v4, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->N:F

    invoke-virtual {v7, v1, v2, v3, v4}, Lb/f/b/k/e;->a(IIIF)V

    .line 159
    iget v1, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->I:I

    iget v2, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->K:I

    iget v3, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->M:I

    iget v4, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->O:F

    invoke-virtual {v7, v1, v2, v3, v4}, Lb/f/b/k/e;->b(IIIF)V

    :cond_2d1
    :goto_2d1
    return-void
.end method

.method public a()Z
    .registers 4

    .line 198
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x11

    if-lt v0, v2, :cond_23

    .line 199
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v2, 0x400000

    and-int/2addr v0, v2

    const/4 v2, 0x1

    if-eqz v0, :cond_19

    const/4 v0, 0x1

    goto :goto_1a

    :cond_19
    const/4 v0, 0x0

    :goto_1a
    if-eqz v0, :cond_23

    .line 200
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getLayoutDirection()I

    move-result v0

    if-ne v2, v0, :cond_23

    const/4 v1, 0x1

    :cond_23
    return v1
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 4

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 2
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0xe

    if-ge p2, p3, :cond_c

    .line 3
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->onViewAdded(Landroid/view/View;)V

    :cond_c
    return-void
.end method

.method public b(I)Landroid/view/View;
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->h:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    return-object p1
.end method

.method public final b()V
    .registers 2

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:Z

    const/4 v0, -0x1

    .line 3
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->u:I

    .line 4
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->v:I

    return-void
.end method

.method public final c()V
    .registers 10

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isInEditMode()Z

    move-result v6

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v7

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v7, :cond_1d

    .line 4
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 5
    invoke-virtual {p0, v2}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroid/view/View;)Lb/f/b/k/e;

    move-result-object v2

    if-nez v2, :cond_17

    goto :goto_1a

    .line 6
    :cond_17
    invoke-virtual {v2}, Lb/f/b/k/e;->H()V

    :goto_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1d
    const/4 v1, -0x1

    if-eqz v6, :cond_5a

    const/4 v2, 0x0

    :goto_21
    if-ge v2, v7, :cond_5a

    .line 7
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 8
    :try_start_27
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v3}, Landroid/view/View;->getId()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v4

    .line 9
    invoke-virtual {v3}, Landroid/view/View;->getId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0, v0, v4, v5}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(ILjava/lang/Object;Ljava/lang/Object;)V

    const/16 v5, 0x2f

    .line 10
    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-eq v5, v1, :cond_4c

    add-int/lit8 v5, v5, 0x1

    .line 11
    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 12
    :cond_4c
    invoke-virtual {v3}, Landroid/view/View;->getId()I

    move-result v3

    invoke-virtual {p0, v3}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(I)Lb/f/b/k/e;

    move-result-object v3

    invoke-virtual {v3, v4}, Lb/f/b/k/e;->a(Ljava/lang/String;)V
    :try_end_57
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_27 .. :try_end_57} :catch_57

    :catch_57
    add-int/lit8 v2, v2, 0x1

    goto :goto_21

    .line 13
    :cond_5a
    iget v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->s:I

    if-eq v2, v1, :cond_7c

    const/4 v1, 0x0

    :goto_5f
    if-ge v1, v7, :cond_7c

    .line 14
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 15
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v3

    iget v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->s:I

    if-ne v3, v4, :cond_79

    instance-of v3, v2, Landroidx/constraintlayout/widget/Constraints;

    if-eqz v3, :cond_79

    .line 16
    check-cast v2, Landroidx/constraintlayout/widget/Constraints;

    invoke-virtual {v2}, Landroidx/constraintlayout/widget/Constraints;->getConstraintSet()Lb/f/c/c;

    move-result-object v2

    iput-object v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Lb/f/c/c;

    :cond_79
    add-int/lit8 v1, v1, 0x1

    goto :goto_5f

    .line 17
    :cond_7c
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Lb/f/c/c;

    if-eqz v1, :cond_84

    const/4 v2, 0x1

    .line 18
    invoke-virtual {v1, p0, v2}, Lb/f/c/c;->a(Landroidx/constraintlayout/widget/ConstraintLayout;Z)V

    .line 19
    :cond_84
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {v1}, Lb/f/b/k/m;->L()V

    .line 20
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->i:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_a2

    const/4 v2, 0x0

    :goto_92
    if-ge v2, v1, :cond_a2

    .line 21
    iget-object v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->i:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 22
    invoke-virtual {v3, p0}, Landroidx/constraintlayout/widget/ConstraintHelper;->f(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_92

    :cond_a2
    const/4 v1, 0x0

    :goto_a3
    if-ge v1, v7, :cond_b5

    .line 23
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 24
    instance-of v3, v2, Landroidx/constraintlayout/widget/Placeholder;

    if-eqz v3, :cond_b2

    .line 25
    check-cast v2, Landroidx/constraintlayout/widget/Placeholder;

    invoke-virtual {v2, p0}, Landroidx/constraintlayout/widget/Placeholder;->b(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    :cond_b2
    add-int/lit8 v1, v1, 0x1

    goto :goto_a3

    .line 26
    :cond_b5
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->w:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->clear()V

    .line 27
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->w:Landroid/util/SparseArray;

    iget-object v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {v1, v0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 28
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->w:Landroid/util/SparseArray;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getId()I

    move-result v2

    iget-object v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    const/4 v1, 0x0

    :goto_cd
    if-ge v1, v7, :cond_e3

    .line 29
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 30
    invoke-virtual {p0, v2}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroid/view/View;)Lb/f/b/k/e;

    move-result-object v3

    .line 31
    iget-object v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->w:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v4, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_cd

    :cond_e3
    const/4 v8, 0x0

    :goto_e4
    if-ge v8, v7, :cond_107

    .line 32
    invoke-virtual {p0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 33
    invoke-virtual {p0, v2}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroid/view/View;)Lb/f/b/k/e;

    move-result-object v3

    if-nez v3, :cond_f1

    goto :goto_104

    .line 34
    :cond_f1
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 35
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {v0, v3}, Lb/f/b/k/m;->a(Lb/f/b/k/e;)V

    .line 36
    iget-object v5, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->w:Landroid/util/SparseArray;

    move-object v0, p0

    move v1, v6

    invoke-virtual/range {v0 .. v5}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(ZLandroid/view/View;Lb/f/b/k/e;Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;Landroid/util/SparseArray;)V

    :goto_104
    add-int/lit8 v8, v8, 0x1

    goto :goto_e4

    :cond_107
    return-void
.end method

.method public c(I)V
    .registers 4

    .line 1
    new-instance v0, Lb/f/c/b;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0, p1}, Lb/f/c/b;-><init>(Landroid/content/Context;Landroidx/constraintlayout/widget/ConstraintLayout;I)V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->r:Lb/f/c/b;

    return-void
.end method

.method public checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 2

    .line 1
    instance-of p1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    return p1
.end method

.method public final d()Z
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v0, :cond_17

    .line 2
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 3
    invoke-virtual {v3}, Landroid/view/View;->isLayoutRequested()Z

    move-result v3

    if-eqz v3, :cond_14

    const/4 v1, 0x1

    goto :goto_17

    :cond_14
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_17
    :goto_17
    if-eqz v1, :cond_1c

    .line 4
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->c()V

    :cond_1c
    return v1
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 22

    move-object/from16 v0, p0

    .line 1
    iget-object v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->i:Ljava/util/ArrayList;

    const/4 v2, 0x0

    if-eqz v1, :cond_1e

    .line 2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1e

    const/4 v3, 0x0

    :goto_e
    if-ge v3, v1, :cond_1e

    .line 3
    iget-object v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->i:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 4
    invoke-virtual {v4, v0}, Landroidx/constraintlayout/widget/ConstraintHelper;->e(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 5
    :cond_1e
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 6
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_df

    .line 7
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .line 8
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v3

    int-to-float v3, v3

    .line 9
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x44870000    # 1080.0f

    const/high16 v6, 0x44f00000    # 1920.0f

    const/4 v7, 0x0

    :goto_3a
    if-ge v7, v1, :cond_df

    .line 10
    invoke-virtual {v0, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 11
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v9

    const/16 v10, 0x8

    if-ne v9, v10, :cond_4a

    goto/16 :goto_db

    .line 12
    :cond_4a
    invoke-virtual {v8}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_db

    .line 13
    instance-of v9, v8, Ljava/lang/String;

    if-eqz v9, :cond_db

    .line 14
    check-cast v8, Ljava/lang/String;

    const-string v9, ","

    .line 15
    invoke-virtual {v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 16
    array-length v9, v8

    const/4 v10, 0x4

    if-ne v9, v10, :cond_db

    .line 17
    aget-object v9, v8, v2

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    const/4 v10, 0x1

    .line 18
    aget-object v10, v8, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    const/4 v11, 0x2

    .line 19
    aget-object v11, v8, v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    const/4 v12, 0x3

    .line 20
    aget-object v8, v8, v12

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    int-to-float v9, v9

    div-float/2addr v9, v5

    mul-float v9, v9, v3

    float-to-int v9, v9

    int-to-float v10, v10

    div-float/2addr v10, v6

    mul-float v10, v10, v4

    float-to-int v10, v10

    int-to-float v11, v11

    div-float/2addr v11, v5

    mul-float v11, v11, v3

    float-to-int v11, v11

    int-to-float v8, v8

    div-float/2addr v8, v6

    mul-float v8, v8, v4

    float-to-int v8, v8

    .line 21
    new-instance v15, Landroid/graphics/Paint;

    invoke-direct {v15}, Landroid/graphics/Paint;-><init>()V

    const/high16 v12, -0x10000

    .line 22
    invoke-virtual {v15, v12}, Landroid/graphics/Paint;->setColor(I)V

    int-to-float v14, v9

    int-to-float v13, v10

    add-int/2addr v9, v11

    int-to-float v9, v9

    move-object/from16 v12, p1

    move v11, v13

    move v13, v14

    move/from16 v18, v14

    move v14, v11

    move-object/from16 v19, v15

    move v15, v9

    move/from16 v16, v11

    move-object/from16 v17, v19

    .line 23
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/2addr v10, v8

    int-to-float v8, v10

    move v13, v9

    move/from16 v16, v8

    .line 24
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v14, v8

    move/from16 v15, v18

    .line 25
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move/from16 v13, v18

    move/from16 v16, v11

    .line 26
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const v10, -0xff0100

    move-object/from16 v15, v19

    .line 27
    invoke-virtual {v15, v10}, Landroid/graphics/Paint;->setColor(I)V

    move v14, v11

    move-object v10, v15

    move v15, v9

    move/from16 v16, v8

    move-object/from16 v17, v10

    .line 28
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v14, v8

    move/from16 v16, v11

    .line 29
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_db
    :goto_db
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_3a

    :cond_df
    return-void
.end method

.method public forceLayout()V
    .registers 1

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->b()V

    .line 2
    invoke-super {p0}, Landroid/view/ViewGroup;->forceLayout()V

    return-void
.end method

.method public bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->generateDefaultLayoutParams()Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateDefaultLayoutParams()Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    .registers 3

    .line 2
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    .line 3
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    invoke-direct {v0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    .registers 4

    .line 2
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public getMaxHeight()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    return v0
.end method

.method public getMaxWidth()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    return v0
.end method

.method public getMinHeight()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:I

    return v0
.end method

.method public getMinWidth()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:I

    return v0
.end method

.method public getOptimizationLevel()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {v0}, Lb/f/b/k/f;->N()I

    move-result v0

    return v0
.end method

.method public onLayout(ZIIII)V
    .registers 11

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isInEditMode()Z

    move-result p2

    const/4 p3, 0x0

    const/4 p4, 0x0

    :goto_a
    if-ge p4, p1, :cond_5e

    .line 3
    invoke-virtual {p0, p4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p5

    .line 4
    invoke-virtual {p5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 5
    iget-object v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m0:Lb/f/b/k/e;

    .line 6
    invoke-virtual {p5}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-ne v2, v3, :cond_2f

    iget-boolean v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Y:Z

    if-nez v2, :cond_2f

    iget-boolean v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Z:Z

    if-nez v2, :cond_2f

    iget-boolean v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->b0:Z

    if-nez v2, :cond_2f

    if-nez p2, :cond_2f

    goto :goto_5b

    .line 7
    :cond_2f
    iget-boolean v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a0:Z

    if-eqz v0, :cond_34

    goto :goto_5b

    .line 8
    :cond_34
    invoke-virtual {v1}, Lb/f/b/k/e;->B()I

    move-result v0

    .line 9
    invoke-virtual {v1}, Lb/f/b/k/e;->C()I

    move-result v2

    .line 10
    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v3

    add-int/2addr v3, v0

    .line 11
    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v1

    add-int/2addr v1, v2

    .line 12
    invoke-virtual {p5, v0, v2, v3, v1}, Landroid/view/View;->layout(IIII)V

    .line 13
    instance-of v4, p5, Landroidx/constraintlayout/widget/Placeholder;

    if-eqz v4, :cond_5b

    .line 14
    check-cast p5, Landroidx/constraintlayout/widget/Placeholder;

    .line 15
    invoke-virtual {p5}, Landroidx/constraintlayout/widget/Placeholder;->getContent()Landroid/view/View;

    move-result-object p5

    if-eqz p5, :cond_5b

    .line 16
    invoke-virtual {p5, p3}, Landroid/view/View;->setVisibility(I)V

    .line 17
    invoke-virtual {p5, v0, v2, v3, v1}, Landroid/view/View;->layout(IIII)V

    :cond_5b
    :goto_5b
    add-int/lit8 p4, p4, 0x1

    goto :goto_a

    .line 18
    :cond_5e
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->i:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_76

    :goto_66
    if-ge p3, p1, :cond_76

    .line 19
    iget-object p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->i:Ljava/util/ArrayList;

    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 20
    invoke-virtual {p2, p0}, Landroidx/constraintlayout/widget/ConstraintHelper;->c(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    add-int/lit8 p3, p3, 0x1

    goto :goto_66

    :cond_76
    return-void
.end method

.method public onMeasure(II)V
    .registers 11

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->a()Z

    move-result v1

    invoke-virtual {v0, v1}, Lb/f/b/k/f;->f(Z)V

    .line 2
    iget-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:Z

    if-eqz v0, :cond_1b

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:Z

    .line 4
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->d()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 5
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {v0}, Lb/f/b/k/f;->V()V

    .line 6
    :cond_1b
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    iget v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    invoke-virtual {p0, v0, v1, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Lb/f/b/k/f;III)V

    .line 7
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {v0}, Lb/f/b/k/e;->A()I

    move-result v4

    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {v0}, Lb/f/b/k/e;->k()I

    move-result v5

    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    .line 8
    invoke-virtual {v0}, Lb/f/b/k/f;->T()Z

    move-result v6

    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {v0}, Lb/f/b/k/f;->R()Z

    move-result v7

    move-object v1, p0

    move v2, p1

    move v3, p2

    .line 9
    invoke-virtual/range {v1 .. v7}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(IIIIZZ)V

    return-void
.end method

.method public onViewAdded(Landroid/view/View;)V
    .registers 5

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_9

    .line 2
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onViewAdded(Landroid/view/View;)V

    .line 3
    :cond_9
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroid/view/View;)Lb/f/b/k/e;

    move-result-object v0

    .line 4
    instance-of v1, p1, Landroidx/constraintlayout/widget/Guideline;

    const/4 v2, 0x1

    if-eqz v1, :cond_2c

    .line 5
    instance-of v0, v0, Lb/f/b/k/h;

    if-nez v0, :cond_2c

    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 7
    new-instance v1, Lb/f/b/k/h;

    invoke-direct {v1}, Lb/f/b/k/h;-><init>()V

    iput-object v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->m0:Lb/f/b/k/e;

    .line 8
    iput-boolean v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Y:Z

    .line 9
    check-cast v1, Lb/f/b/k/h;

    iget v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->R:I

    invoke-virtual {v1, v0}, Lb/f/b/k/h;->v(I)V

    .line 10
    :cond_2c
    instance-of v0, p1, Landroidx/constraintlayout/widget/ConstraintHelper;

    if-eqz v0, :cond_4b

    .line 11
    move-object v0, p1

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 12
    invoke-virtual {v0}, Landroidx/constraintlayout/widget/ConstraintHelper;->b()V

    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 14
    iput-boolean v2, v1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->Z:Z

    .line 15
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->i:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4b

    .line 16
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->i:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    :cond_4b
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->h:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 18
    iput-boolean v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:Z

    return-void
.end method

.method public onViewRemoved(Landroid/view/View;)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_9

    .line 2
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onViewRemoved(Landroid/view/View;)V

    .line 3
    :cond_9
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->h:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 4
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroid/view/View;)Lb/f/b/k/e;

    move-result-object v0

    .line 5
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {v1, v0}, Lb/f/b/k/m;->c(Lb/f/b/k/e;)V

    .line 6
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->i:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->o:Z

    return-void
.end method

.method public removeView(Landroid/view/View;)V
    .registers 4

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-ge v0, v1, :cond_c

    .line 3
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->onViewRemoved(Landroid/view/View;)V

    :cond_c
    return-void
.end method

.method public requestLayout()V
    .registers 1

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->b()V

    .line 2
    invoke-super {p0}, Landroid/view/ViewGroup;->requestLayout()V

    return-void
.end method

.method public setConstraintSet(Lb/f/c/c;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->q:Lb/f/c/c;

    return-void
.end method

.method public setId(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->h:Landroid/util/SparseArray;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 2
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setId(I)V

    .line 3
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->h:Landroid/util/SparseArray;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getId()I

    move-result v0

    invoke-virtual {p1, v0, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method public setMaxHeight(I)V
    .registers 3

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    if-ne p1, v0, :cond_5

    return-void

    .line 2
    :cond_5
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->n:I

    .line 3
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    return-void
.end method

.method public setMaxWidth(I)V
    .registers 3

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    if-ne p1, v0, :cond_5

    return-void

    .line 2
    :cond_5
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->m:I

    .line 3
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    return-void
.end method

.method public setMinHeight(I)V
    .registers 3

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:I

    if-ne p1, v0, :cond_5

    return-void

    .line 2
    :cond_5
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->l:I

    .line 3
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    return-void
.end method

.method public setMinWidth(I)V
    .registers 3

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:I

    if-ne p1, v0, :cond_5

    return-void

    .line 2
    :cond_5
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->k:I

    .line 3
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    return-void
.end method

.method public setOnConstraintsChanged(Lb/f/c/d;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->r:Lb/f/c/b;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lb/f/c/b;->a(Lb/f/c/d;)V

    :cond_7
    return-void
.end method

.method public setOptimizationLevel(I)V
    .registers 3

    .line 1
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->p:I

    .line 2
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->j:Lb/f/b/k/f;

    invoke-virtual {v0, p1}, Lb/f/b/k/f;->u(I)V

    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method
