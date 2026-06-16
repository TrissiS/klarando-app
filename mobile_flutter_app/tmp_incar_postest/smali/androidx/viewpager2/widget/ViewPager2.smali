.class public final Landroidx/viewpager2/widget/ViewPager2;
.super Landroid/view/ViewGroup;
.source "ViewPager2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/viewpager2/widget/ViewPager2$g;,
        Landroidx/viewpager2/widget/ViewPager2$j;,
        Landroidx/viewpager2/widget/ViewPager2$f;,
        Landroidx/viewpager2/widget/ViewPager2$e;,
        Landroidx/viewpager2/widget/ViewPager2$k;,
        Landroidx/viewpager2/widget/ViewPager2$i;,
        Landroidx/viewpager2/widget/ViewPager2$n;,
        Landroidx/viewpager2/widget/ViewPager2$l;,
        Landroidx/viewpager2/widget/ViewPager2$h;,
        Landroidx/viewpager2/widget/ViewPager2$m;,
        Landroidx/viewpager2/widget/ViewPager2$SavedState;
    }
.end annotation


# static fields
.field public static B:Z = true


# instance fields
.field public A:Landroidx/viewpager2/widget/ViewPager2$e;

.field public final h:Landroid/graphics/Rect;

.field public final i:Landroid/graphics/Rect;

.field public j:Lb/w/c/b;

.field public k:I

.field public l:Z

.field public m:Landroidx/recyclerview/widget/RecyclerView$i;

.field public n:Landroidx/recyclerview/widget/LinearLayoutManager;

.field public o:I

.field public p:Landroid/os/Parcelable;

.field public q:Landroidx/recyclerview/widget/RecyclerView;

.field public r:Lb/p/d/j;

.field public s:Lb/w/c/e;

.field public t:Lb/w/c/b;

.field public u:Lb/w/c/c;

.field public v:Lb/w/c/d;

.field public w:Landroidx/recyclerview/widget/RecyclerView$l;

.field public x:Z

.field public y:Z

.field public z:I


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    .line 1
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->h:Landroid/graphics/Rect;

    .line 3
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->i:Landroid/graphics/Rect;

    .line 4
    new-instance v0, Lb/w/c/b;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lb/w/c/b;-><init>(I)V

    iput-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->j:Lb/w/c/b;

    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Landroidx/viewpager2/widget/ViewPager2;->l:Z

    .line 6
    new-instance v1, Landroidx/viewpager2/widget/ViewPager2$a;

    invoke-direct {v1, p0}, Landroidx/viewpager2/widget/ViewPager2$a;-><init>(Landroidx/viewpager2/widget/ViewPager2;)V

    iput-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->m:Landroidx/recyclerview/widget/RecyclerView$i;

    const/4 v1, -0x1

    .line 7
    iput v1, p0, Landroidx/viewpager2/widget/ViewPager2;->o:I

    const/4 v2, 0x0

    .line 8
    iput-object v2, p0, Landroidx/viewpager2/widget/ViewPager2;->w:Landroidx/recyclerview/widget/RecyclerView$l;

    .line 9
    iput-boolean v0, p0, Landroidx/viewpager2/widget/ViewPager2;->x:Z

    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Landroidx/viewpager2/widget/ViewPager2;->y:Z

    .line 11
    iput v1, p0, Landroidx/viewpager2/widget/ViewPager2;->z:I

    .line 12
    invoke-virtual {p0, p1, v2}, Landroidx/viewpager2/widget/ViewPager2;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6

    .line 13
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->h:Landroid/graphics/Rect;

    .line 15
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->i:Landroid/graphics/Rect;

    .line 16
    new-instance v0, Lb/w/c/b;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lb/w/c/b;-><init>(I)V

    iput-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->j:Lb/w/c/b;

    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Landroidx/viewpager2/widget/ViewPager2;->l:Z

    .line 18
    new-instance v1, Landroidx/viewpager2/widget/ViewPager2$a;

    invoke-direct {v1, p0}, Landroidx/viewpager2/widget/ViewPager2$a;-><init>(Landroidx/viewpager2/widget/ViewPager2;)V

    iput-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->m:Landroidx/recyclerview/widget/RecyclerView$i;

    const/4 v1, -0x1

    .line 19
    iput v1, p0, Landroidx/viewpager2/widget/ViewPager2;->o:I

    const/4 v2, 0x0

    .line 20
    iput-object v2, p0, Landroidx/viewpager2/widget/ViewPager2;->w:Landroidx/recyclerview/widget/RecyclerView$l;

    .line 21
    iput-boolean v0, p0, Landroidx/viewpager2/widget/ViewPager2;->x:Z

    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Landroidx/viewpager2/widget/ViewPager2;->y:Z

    .line 23
    iput v1, p0, Landroidx/viewpager2/widget/ViewPager2;->z:I

    .line 24
    invoke-virtual {p0, p1, p2}, Landroidx/viewpager2/widget/ViewPager2;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6

    .line 25
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 26
    new-instance p3, Landroid/graphics/Rect;

    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    iput-object p3, p0, Landroidx/viewpager2/widget/ViewPager2;->h:Landroid/graphics/Rect;

    .line 27
    new-instance p3, Landroid/graphics/Rect;

    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    iput-object p3, p0, Landroidx/viewpager2/widget/ViewPager2;->i:Landroid/graphics/Rect;

    .line 28
    new-instance p3, Lb/w/c/b;

    const/4 v0, 0x3

    invoke-direct {p3, v0}, Lb/w/c/b;-><init>(I)V

    iput-object p3, p0, Landroidx/viewpager2/widget/ViewPager2;->j:Lb/w/c/b;

    const/4 p3, 0x0

    .line 29
    iput-boolean p3, p0, Landroidx/viewpager2/widget/ViewPager2;->l:Z

    .line 30
    new-instance v0, Landroidx/viewpager2/widget/ViewPager2$a;

    invoke-direct {v0, p0}, Landroidx/viewpager2/widget/ViewPager2$a;-><init>(Landroidx/viewpager2/widget/ViewPager2;)V

    iput-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->m:Landroidx/recyclerview/widget/RecyclerView$i;

    const/4 v0, -0x1

    .line 31
    iput v0, p0, Landroidx/viewpager2/widget/ViewPager2;->o:I

    const/4 v1, 0x0

    .line 32
    iput-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->w:Landroidx/recyclerview/widget/RecyclerView$l;

    .line 33
    iput-boolean p3, p0, Landroidx/viewpager2/widget/ViewPager2;->x:Z

    const/4 p3, 0x1

    .line 34
    iput-boolean p3, p0, Landroidx/viewpager2/widget/ViewPager2;->y:Z

    .line 35
    iput v0, p0, Landroidx/viewpager2/widget/ViewPager2;->z:I

    .line 36
    invoke-virtual {p0, p1, p2}, Landroidx/viewpager2/widget/ViewPager2;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a()Landroidx/recyclerview/widget/RecyclerView$p;
    .registers 2

    .line 27
    new-instance v0, Landroidx/viewpager2/widget/ViewPager2$d;

    invoke-direct {v0, p0}, Landroidx/viewpager2/widget/ViewPager2$d;-><init>(Landroidx/viewpager2/widget/ViewPager2;)V

    return-object v0
.end method

.method public a(IZ)V
    .registers 4

    .line 29
    invoke-virtual {p0}, Landroidx/viewpager2/widget/ViewPager2;->b()Z

    move-result v0

    if-nez v0, :cond_a

    .line 30
    invoke-virtual {p0, p1, p2}, Landroidx/viewpager2/widget/ViewPager2;->b(IZ)V

    return-void

    .line 31
    :cond_a
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Cannot change current item when ViewPager2 is fake dragging"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5

    .line 1
    sget-boolean v0, Landroidx/viewpager2/widget/ViewPager2;->B:Z

    if-eqz v0, :cond_a

    new-instance v0, Landroidx/viewpager2/widget/ViewPager2$j;

    invoke-direct {v0, p0}, Landroidx/viewpager2/widget/ViewPager2$j;-><init>(Landroidx/viewpager2/widget/ViewPager2;)V

    goto :goto_f

    :cond_a
    new-instance v0, Landroidx/viewpager2/widget/ViewPager2$f;

    invoke-direct {v0, p0}, Landroidx/viewpager2/widget/ViewPager2$f;-><init>(Landroidx/viewpager2/widget/ViewPager2;)V

    :goto_f
    iput-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->A:Landroidx/viewpager2/widget/ViewPager2$e;

    .line 2
    new-instance v0, Landroidx/viewpager2/widget/ViewPager2$m;

    invoke-direct {v0, p0, p1}, Landroidx/viewpager2/widget/ViewPager2$m;-><init>(Landroidx/viewpager2/widget/ViewPager2;Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    .line 3
    invoke-static {}, Lb/h/m/y;->b()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setId(I)V

    .line 4
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    const/high16 v1, 0x20000

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 5
    new-instance v0, Landroidx/viewpager2/widget/ViewPager2$h;

    invoke-direct {v0, p0, p1}, Landroidx/viewpager2/widget/ViewPager2$h;-><init>(Landroidx/viewpager2/widget/ViewPager2;Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->n:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 6
    iget-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 7
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setScrollingTouchSlop(I)V

    .line 8
    invoke-virtual {p0, p1, p2}, Landroidx/viewpager2/widget/ViewPager2;->b(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    iget-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p2, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 10
    iget-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroidx/viewpager2/widget/ViewPager2;->a()Landroidx/recyclerview/widget/RecyclerView$p;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->a(Landroidx/recyclerview/widget/RecyclerView$p;)V

    .line 11
    new-instance p1, Lb/w/c/e;

    invoke-direct {p1, p0}, Lb/w/c/e;-><init>(Landroidx/viewpager2/widget/ViewPager2;)V

    iput-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->s:Lb/w/c/e;

    .line 12
    new-instance p2, Lb/w/c/c;

    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {p2, p0, p1, v0}, Lb/w/c/c;-><init>(Landroidx/viewpager2/widget/ViewPager2;Lb/w/c/e;Landroidx/recyclerview/widget/RecyclerView;)V

    iput-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->u:Lb/w/c/c;

    .line 13
    new-instance p1, Landroidx/viewpager2/widget/ViewPager2$l;

    invoke-direct {p1, p0}, Landroidx/viewpager2/widget/ViewPager2$l;-><init>(Landroidx/viewpager2/widget/ViewPager2;)V

    iput-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->r:Lb/p/d/j;

    .line 14
    iget-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, p2}, Lb/p/d/n;->a(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 15
    iget-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->s:Lb/w/c/e;

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->a(Landroidx/recyclerview/widget/RecyclerView$s;)V

    .line 16
    new-instance p1, Lb/w/c/b;

    const/4 p2, 0x3

    invoke-direct {p1, p2}, Lb/w/c/b;-><init>(I)V

    iput-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->t:Lb/w/c/b;

    .line 17
    iget-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->s:Lb/w/c/e;

    invoke-virtual {p2, p1}, Lb/w/c/e;->a(Landroidx/viewpager2/widget/ViewPager2$i;)V

    .line 18
    new-instance p1, Landroidx/viewpager2/widget/ViewPager2$b;

    invoke-direct {p1, p0}, Landroidx/viewpager2/widget/ViewPager2$b;-><init>(Landroidx/viewpager2/widget/ViewPager2;)V

    .line 19
    new-instance p2, Landroidx/viewpager2/widget/ViewPager2$c;

    invoke-direct {p2, p0}, Landroidx/viewpager2/widget/ViewPager2$c;-><init>(Landroidx/viewpager2/widget/ViewPager2;)V

    .line 20
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->t:Lb/w/c/b;

    invoke-virtual {v0, p1}, Lb/w/c/b;->a(Landroidx/viewpager2/widget/ViewPager2$i;)V

    .line 21
    iget-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->t:Lb/w/c/b;

    invoke-virtual {p1, p2}, Lb/w/c/b;->a(Landroidx/viewpager2/widget/ViewPager2$i;)V

    .line 22
    iget-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->A:Landroidx/viewpager2/widget/ViewPager2$e;

    iget-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->t:Lb/w/c/b;

    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, p2, v0}, Landroidx/viewpager2/widget/ViewPager2$e;->a(Lb/w/c/b;Landroidx/recyclerview/widget/RecyclerView;)V

    .line 23
    iget-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->t:Lb/w/c/b;

    iget-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->j:Lb/w/c/b;

    invoke-virtual {p1, p2}, Lb/w/c/b;->a(Landroidx/viewpager2/widget/ViewPager2$i;)V

    .line 24
    new-instance p1, Lb/w/c/d;

    iget-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->n:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {p1, p2}, Lb/w/c/d;-><init>(Landroidx/recyclerview/widget/LinearLayoutManager;)V

    iput-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->v:Lb/w/c/d;

    .line 25
    iget-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->t:Lb/w/c/b;

    invoke-virtual {p2, p1}, Lb/w/c/b;->a(Landroidx/viewpager2/widget/ViewPager2$i;)V

    .line 26
    iget-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    const/4 p2, 0x0

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Landroid/view/ViewGroup;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView$g;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView$g<",
            "*>;)V"
        }
    .end annotation

    if-eqz p1, :cond_7

    .line 28
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->m:Landroidx/recyclerview/widget/RecyclerView$i;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$g;->a(Landroidx/recyclerview/widget/RecyclerView$i;)V

    :cond_7
    return-void
.end method

.method public b(IZ)V
    .registers 11

    .line 10
    invoke-virtual {p0}, Landroidx/viewpager2/widget/ViewPager2;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$g;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_13

    .line 11
    iget p2, p0, Landroidx/viewpager2/widget/ViewPager2;->o:I

    const/4 v0, -0x1

    if-eq p2, v0, :cond_12

    .line 12
    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Landroidx/viewpager2/widget/ViewPager2;->o:I

    :cond_12
    return-void

    .line 13
    :cond_13
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$g;->b()I

    move-result v2

    if-gtz v2, :cond_1a

    return-void

    .line 14
    :cond_1a
    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 15
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$g;->b()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 16
    iget v0, p0, Landroidx/viewpager2/widget/ViewPager2;->k:I

    if-ne p1, v0, :cond_35

    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->s:Lb/w/c/e;

    invoke-virtual {v0}, Lb/w/c/e;->e()Z

    move-result v0

    if-eqz v0, :cond_35

    return-void

    .line 17
    :cond_35
    iget v0, p0, Landroidx/viewpager2/widget/ViewPager2;->k:I

    if-ne p1, v0, :cond_3c

    if-eqz p2, :cond_3c

    return-void

    .line 18
    :cond_3c
    iget v0, p0, Landroidx/viewpager2/widget/ViewPager2;->k:I

    int-to-double v0, v0

    .line 19
    iput p1, p0, Landroidx/viewpager2/widget/ViewPager2;->k:I

    .line 20
    iget-object v2, p0, Landroidx/viewpager2/widget/ViewPager2;->A:Landroidx/viewpager2/widget/ViewPager2$e;

    invoke-virtual {v2}, Landroidx/viewpager2/widget/ViewPager2$e;->g()V

    .line 21
    iget-object v2, p0, Landroidx/viewpager2/widget/ViewPager2;->s:Lb/w/c/e;

    invoke-virtual {v2}, Lb/w/c/e;->e()Z

    move-result v2

    if-nez v2, :cond_54

    .line 22
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->s:Lb/w/c/e;

    invoke-virtual {v0}, Lb/w/c/e;->b()D

    move-result-wide v0

    .line 23
    :cond_54
    iget-object v2, p0, Landroidx/viewpager2/widget/ViewPager2;->s:Lb/w/c/e;

    invoke-virtual {v2, p1, p2}, Lb/w/c/e;->a(IZ)V

    if-nez p2, :cond_61

    .line 24
    iget-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->g(I)V

    return-void

    :cond_61
    int-to-double v2, p1

    sub-double v4, v2, v0

    .line 25
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    const-wide/high16 v6, 0x4008000000000000L    # 3.0

    cmpl-double p2, v4, v6

    if-lez p2, :cond_87

    .line 26
    iget-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    cmpl-double v4, v2, v0

    if-lez v4, :cond_77

    add-int/lit8 v0, p1, -0x3

    goto :goto_79

    :cond_77
    add-int/lit8 v0, p1, 0x3

    :goto_79
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->g(I)V

    .line 27
    iget-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v0, Landroidx/viewpager2/widget/ViewPager2$n;

    invoke-direct {v0, p1, p2}, Landroidx/viewpager2/widget/ViewPager2$n;-><init>(ILandroidx/recyclerview/widget/RecyclerView;)V

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    goto :goto_8c

    .line 28
    :cond_87
    iget-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->h(I)V

    :goto_8c
    return-void
.end method

.method public final b(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 11

    .line 1
    sget-object v0, Lb/w/a;->ViewPager2:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v1, v2, :cond_17

    .line 3
    sget-object v3, Lb/w/a;->ViewPager2:[I

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move-object v5, v0

    invoke-virtual/range {v1 .. v7}, Landroid/view/ViewGroup;->saveAttributeDataForStyleable(Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 4
    :cond_17
    :try_start_17
    sget p1, Lb/w/a;->ViewPager2_android_orientation:I

    const/4 p2, 0x0

    .line 5
    invoke-virtual {v0, p1, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p1

    .line 6
    invoke-virtual {p0, p1}, Landroidx/viewpager2/widget/ViewPager2;->setOrientation(I)V
    :try_end_21
    .catchall {:try_start_17 .. :try_end_21} :catchall_25

    .line 7
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :catchall_25
    move-exception p1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 8
    throw p1
.end method

.method public final b(Landroidx/recyclerview/widget/RecyclerView$g;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView$g<",
            "*>;)V"
        }
    .end annotation

    if-eqz p1, :cond_7

    .line 9
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->m:Landroidx/recyclerview/widget/RecyclerView$i;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$g;->b(Landroidx/recyclerview/widget/RecyclerView$i;)V

    :cond_7
    return-void
.end method

.method public b()Z
    .registers 2

    .line 29
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->u:Lb/w/c/c;

    invoke-virtual {v0}, Lb/w/c/c;->a()Z

    move-result v0

    return v0
.end method

.method public c()Z
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->n:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->k()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_a

    goto :goto_b

    :cond_a
    const/4 v1, 0x0

    :goto_b
    return v1
.end method

.method public canScrollHorizontally(I)Z
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->canScrollHorizontally(I)Z

    move-result p1

    return p1
.end method

.method public canScrollVertically(I)Z
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    move-result p1

    return p1
.end method

.method public d()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/viewpager2/widget/ViewPager2;->y:Z

    return v0
.end method

.method public dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getId()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Parcelable;

    .line 2
    instance-of v1, v0, Landroidx/viewpager2/widget/ViewPager2$SavedState;

    if-eqz v1, :cond_22

    .line 3
    check-cast v0, Landroidx/viewpager2/widget/ViewPager2$SavedState;

    iget v0, v0, Landroidx/viewpager2/widget/ViewPager2$SavedState;->h:I

    .line 4
    iget-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getId()I

    move-result v1

    .line 5
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 6
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->remove(I)V

    .line 7
    :cond_22
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchRestoreInstanceState(Landroid/util/SparseArray;)V

    .line 8
    invoke-virtual {p0}, Landroidx/viewpager2/widget/ViewPager2;->f()V

    return-void
.end method

.method public e()V
    .registers 6

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->v:Lb/w/c/d;

    invoke-virtual {v0}, Lb/w/c/d;->a()Landroidx/viewpager2/widget/ViewPager2$k;

    move-result-object v0

    if-nez v0, :cond_9

    return-void

    .line 2
    :cond_9
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->s:Lb/w/c/e;

    invoke-virtual {v0}, Lb/w/c/e;->b()D

    move-result-wide v0

    double-to-int v2, v0

    int-to-double v3, v2

    sub-double/2addr v0, v3

    double-to-float v0, v0

    .line 3
    invoke-virtual {p0}, Landroidx/viewpager2/widget/ViewPager2;->getPageSize()I

    move-result v1

    int-to-float v1, v1

    mul-float v1, v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 4
    iget-object v3, p0, Landroidx/viewpager2/widget/ViewPager2;->v:Lb/w/c/d;

    invoke-virtual {v3, v2, v0, v1}, Lb/w/c/d;->a(IFI)V

    return-void
.end method

.method public final f()V
    .registers 5

    .line 1
    iget v0, p0, Landroidx/viewpager2/widget/ViewPager2;->o:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_6

    return-void

    .line 2
    :cond_6
    invoke-virtual {p0}, Landroidx/viewpager2/widget/ViewPager2;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$g;

    move-result-object v0

    if-nez v0, :cond_d

    return-void

    .line 3
    :cond_d
    iget-object v2, p0, Landroidx/viewpager2/widget/ViewPager2;->p:Landroid/os/Parcelable;

    if-eqz v2, :cond_1e

    .line 4
    instance-of v3, v0, Lb/w/b/c;

    if-eqz v3, :cond_1b

    .line 5
    move-object v3, v0

    check-cast v3, Lb/w/b/c;

    invoke-interface {v3, v2}, Lb/w/b/c;->a(Landroid/os/Parcelable;)V

    :cond_1b
    const/4 v2, 0x0

    .line 6
    iput-object v2, p0, Landroidx/viewpager2/widget/ViewPager2;->p:Landroid/os/Parcelable;

    :cond_1e
    const/4 v2, 0x0

    .line 7
    iget v3, p0, Landroidx/viewpager2/widget/ViewPager2;->o:I

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$g;->b()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Landroidx/viewpager2/widget/ViewPager2;->k:I

    .line 8
    iput v1, p0, Landroidx/viewpager2/widget/ViewPager2;->o:I

    .line 9
    iget-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->g(I)V

    .line 10
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->A:Landroidx/viewpager2/widget/ViewPager2$e;

    invoke-virtual {v0}, Landroidx/viewpager2/widget/ViewPager2$e;->d()V

    return-void
.end method

.method public g()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->r:Lb/p/d/j;

    if-eqz v0, :cond_26

    .line 2
    iget-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->n:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0, v1}, Lb/p/d/j;->c(Landroidx/recyclerview/widget/RecyclerView$o;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_d

    return-void

    .line 3
    :cond_d
    iget-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->n:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v0

    .line 4
    iget v1, p0, Landroidx/viewpager2/widget/ViewPager2;->k:I

    if-eq v0, v1, :cond_22

    invoke-virtual {p0}, Landroidx/viewpager2/widget/ViewPager2;->getScrollState()I

    move-result v1

    if-nez v1, :cond_22

    .line 5
    iget-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->t:Lb/w/c/b;

    invoke-virtual {v1, v0}, Lb/w/c/b;->b(I)V

    :cond_22
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Landroidx/viewpager2/widget/ViewPager2;->l:Z

    return-void

    .line 7
    :cond_26
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Design assumption violated."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAccessibilityClassName()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->A:Landroidx/viewpager2/widget/ViewPager2$e;

    invoke-virtual {v0}, Landroidx/viewpager2/widget/ViewPager2$e;->a()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 2
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->A:Landroidx/viewpager2/widget/ViewPager2$e;

    invoke-virtual {v0}, Landroidx/viewpager2/widget/ViewPager2$e;->c()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 3
    :cond_f
    invoke-super {p0}, Landroid/view/ViewGroup;->getAccessibilityClassName()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Landroidx/recyclerview/widget/RecyclerView$g;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$g;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentItem()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/viewpager2/widget/ViewPager2;->k:I

    return v0
.end method

.method public getItemDecorationCount()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getItemDecorationCount()I

    move-result v0

    return v0
.end method

.method public getOffscreenPageLimit()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/viewpager2/widget/ViewPager2;->z:I

    return v0
.end method

.method public getOrientation()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->n:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->O()I

    move-result v0

    return v0
.end method

.method public getPageSize()I
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    invoke-virtual {p0}, Landroidx/viewpager2/widget/ViewPager2;->getOrientation()I

    move-result v1

    if-nez v1, :cond_16

    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v0

    goto :goto_23

    .line 4
    :cond_16
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v0

    :goto_23
    sub-int/2addr v1, v0

    return v1
.end method

.method public getScrollState()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->s:Lb/w/c/e;

    invoke-virtual {v0}, Lb/w/c/e;->c()I

    move-result v0

    return v0
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->A:Landroidx/viewpager2/widget/ViewPager2$e;

    invoke-virtual {v0, p1}, Landroidx/viewpager2/widget/ViewPager2$e;->a(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    return-void
.end method

.method public onLayout(ZIIII)V
    .registers 9

    .line 1
    iget-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result p1

    .line 2
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    move-result v0

    .line 3
    iget-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->h:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v2

    iput v2, v1, Landroid/graphics/Rect;->left:I

    .line 4
    iget-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->h:Landroid/graphics/Rect;

    sub-int/2addr p4, p2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result p2

    sub-int/2addr p4, p2

    iput p4, v1, Landroid/graphics/Rect;->right:I

    .line 5
    iget-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->h:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result p4

    iput p4, p2, Landroid/graphics/Rect;->top:I

    .line 6
    iget-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->h:Landroid/graphics/Rect;

    sub-int/2addr p5, p3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result p3

    sub-int/2addr p5, p3

    iput p5, p2, Landroid/graphics/Rect;->bottom:I

    .line 7
    iget-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->h:Landroid/graphics/Rect;

    iget-object p3, p0, Landroidx/viewpager2/widget/ViewPager2;->i:Landroid/graphics/Rect;

    const p4, 0x800033

    invoke-static {p4, p1, v0, p2, p3}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 8
    iget-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p2, p0, Landroidx/viewpager2/widget/ViewPager2;->i:Landroid/graphics/Rect;

    iget p3, p2, Landroid/graphics/Rect;->left:I

    iget p4, p2, Landroid/graphics/Rect;->top:I

    iget p5, p2, Landroid/graphics/Rect;->right:I

    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1, p3, p4, p5, p2}, Landroid/view/ViewGroup;->layout(IIII)V

    .line 9
    iget-boolean p1, p0, Landroidx/viewpager2/widget/ViewPager2;->l:Z

    if-eqz p1, :cond_50

    .line 10
    invoke-virtual {p0}, Landroidx/viewpager2/widget/ViewPager2;->g()V

    :cond_50
    return-void
.end method

.method public onMeasure(II)V
    .registers 8

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v0, p1, p2}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    .line 2
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result v0

    .line 3
    iget-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    move-result v1

    .line 4
    iget-object v2, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getMeasuredState()I

    move-result v2

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v4

    add-int/2addr v3, v4

    add-int/2addr v0, v3

    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v4

    add-int/2addr v3, v4

    add-int/2addr v1, v3

    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumWidth()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumHeight()I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 9
    invoke-static {v0, p1, v2}, Landroid/view/ViewGroup;->resolveSizeAndState(III)I

    move-result p1

    shl-int/lit8 v0, v2, 0x10

    .line 10
    invoke-static {v1, p2, v0}, Landroid/view/ViewGroup;->resolveSizeAndState(III)I

    move-result p2

    .line 11
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 3

    .line 1
    instance-of v0, p1, Landroidx/viewpager2/widget/ViewPager2$SavedState;

    if-nez v0, :cond_8

    .line 2
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    .line 3
    :cond_8
    check-cast p1, Landroidx/viewpager2/widget/ViewPager2$SavedState;

    .line 4
    invoke-virtual {p1}, Landroid/view/View$BaseSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 5
    iget v0, p1, Landroidx/viewpager2/widget/ViewPager2$SavedState;->i:I

    iput v0, p0, Landroidx/viewpager2/widget/ViewPager2;->o:I

    .line 6
    iget-object p1, p1, Landroidx/viewpager2/widget/ViewPager2$SavedState;->j:Landroid/os/Parcelable;

    iput-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->p:Landroid/os/Parcelable;

    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 2
    new-instance v1, Landroidx/viewpager2/widget/ViewPager2$SavedState;

    invoke-direct {v1, v0}, Landroidx/viewpager2/widget/ViewPager2$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 3
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getId()I

    move-result v0

    iput v0, v1, Landroidx/viewpager2/widget/ViewPager2$SavedState;->h:I

    .line 4
    iget v0, p0, Landroidx/viewpager2/widget/ViewPager2;->o:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_18

    iget v0, p0, Landroidx/viewpager2/widget/ViewPager2;->k:I

    :cond_18
    iput v0, v1, Landroidx/viewpager2/widget/ViewPager2$SavedState;->i:I

    .line 5
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->p:Landroid/os/Parcelable;

    if-eqz v0, :cond_21

    .line 6
    iput-object v0, v1, Landroidx/viewpager2/widget/ViewPager2$SavedState;->j:Landroid/os/Parcelable;

    goto :goto_33

    .line 7
    :cond_21
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$g;

    move-result-object v0

    .line 8
    instance-of v2, v0, Lb/w/b/c;

    if-eqz v2, :cond_33

    .line 9
    check-cast v0, Lb/w/b/c;

    invoke-interface {v0}, Lb/w/b/c;->a()Landroid/os/Parcelable;

    move-result-object v0

    iput-object v0, v1, Landroidx/viewpager2/widget/ViewPager2$SavedState;->j:Landroid/os/Parcelable;

    :cond_33
    :goto_33
    return-object v1
.end method

.method public onViewAdded(Landroid/view/View;)V
    .registers 4

    .line 1
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2
    const-class v1, Landroidx/viewpager2/widget/ViewPager2;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " does not support direct child views"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public performAccessibilityAction(ILandroid/os/Bundle;)Z
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->A:Landroidx/viewpager2/widget/ViewPager2$e;

    invoke-virtual {v0, p1, p2}, Landroidx/viewpager2/widget/ViewPager2$e;->a(ILandroid/os/Bundle;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 2
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->A:Landroidx/viewpager2/widget/ViewPager2$e;

    invoke-virtual {v0, p1, p2}, Landroidx/viewpager2/widget/ViewPager2$e;->b(ILandroid/os/Bundle;)Z

    move-result p1

    return p1

    .line 3
    :cond_f
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    move-result p1

    return p1
.end method

.method public setAdapter(Landroidx/recyclerview/widget/RecyclerView$g;)V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$g;

    move-result-object v0

    .line 2
    iget-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->A:Landroidx/viewpager2/widget/ViewPager2$e;

    invoke-virtual {v1, v0}, Landroidx/viewpager2/widget/ViewPager2$e;->b(Landroidx/recyclerview/widget/RecyclerView$g;)V

    .line 3
    invoke-virtual {p0, v0}, Landroidx/viewpager2/widget/ViewPager2;->b(Landroidx/recyclerview/widget/RecyclerView$g;)V

    .line 4
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$g;)V

    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroidx/viewpager2/widget/ViewPager2;->k:I

    .line 6
    invoke-virtual {p0}, Landroidx/viewpager2/widget/ViewPager2;->f()V

    .line 7
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->A:Landroidx/viewpager2/widget/ViewPager2$e;

    invoke-virtual {v0, p1}, Landroidx/viewpager2/widget/ViewPager2$e;->a(Landroidx/recyclerview/widget/RecyclerView$g;)V

    .line 8
    invoke-virtual {p0, p1}, Landroidx/viewpager2/widget/ViewPager2;->a(Landroidx/recyclerview/widget/RecyclerView$g;)V

    return-void
.end method

.method public setCurrentItem(I)V
    .registers 3

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager2/widget/ViewPager2;->a(IZ)V

    return-void
.end method

.method public setLayoutDirection(I)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setLayoutDirection(I)V

    .line 2
    iget-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->A:Landroidx/viewpager2/widget/ViewPager2$e;

    invoke-virtual {p1}, Landroidx/viewpager2/widget/ViewPager2$e;->f()V

    return-void
.end method

.method public setOffscreenPageLimit(I)V
    .registers 3

    const/4 v0, 0x1

    if-ge p1, v0, :cond_f

    const/4 v0, -0x1

    if-ne p1, v0, :cond_7

    goto :goto_f

    .line 1
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Offscreen page limit must be OFFSCREEN_PAGE_LIMIT_DEFAULT or a number > 0"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2
    :cond_f
    :goto_f
    iput p1, p0, Landroidx/viewpager2/widget/ViewPager2;->z:I

    .line 3
    iget-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    return-void
.end method

.method public setOrientation(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->n:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->k(I)V

    .line 2
    iget-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->A:Landroidx/viewpager2/widget/ViewPager2$e;

    invoke-virtual {p1}, Landroidx/viewpager2/widget/ViewPager2$e;->h()V

    return-void
.end method

.method public setPageTransformer(Landroidx/viewpager2/widget/ViewPager2$k;)V
    .registers 5

    const/4 v0, 0x0

    if-eqz p1, :cond_18

    .line 1
    iget-boolean v1, p0, Landroidx/viewpager2/widget/ViewPager2;->x:Z

    if-nez v1, :cond_12

    .line 2
    iget-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    move-result-object v1

    iput-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->w:Landroidx/recyclerview/widget/RecyclerView$l;

    const/4 v1, 0x1

    .line 3
    iput-boolean v1, p0, Landroidx/viewpager2/widget/ViewPager2;->x:Z

    .line 4
    :cond_12
    iget-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    goto :goto_28

    .line 5
    :cond_18
    iget-boolean v1, p0, Landroidx/viewpager2/widget/ViewPager2;->x:Z

    if-eqz v1, :cond_28

    .line 6
    iget-object v1, p0, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, p0, Landroidx/viewpager2/widget/ViewPager2;->w:Landroidx/recyclerview/widget/RecyclerView$l;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 7
    iput-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->w:Landroidx/recyclerview/widget/RecyclerView$l;

    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Landroidx/viewpager2/widget/ViewPager2;->x:Z

    .line 9
    :cond_28
    :goto_28
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->v:Lb/w/c/d;

    invoke-virtual {v0}, Lb/w/c/d;->a()Landroidx/viewpager2/widget/ViewPager2$k;

    move-result-object v0

    if-ne p1, v0, :cond_31

    return-void

    .line 10
    :cond_31
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2;->v:Lb/w/c/d;

    invoke-virtual {v0, p1}, Lb/w/c/d;->a(Landroidx/viewpager2/widget/ViewPager2$k;)V

    .line 11
    invoke-virtual {p0}, Landroidx/viewpager2/widget/ViewPager2;->e()V

    return-void
.end method

.method public setUserInputEnabled(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Landroidx/viewpager2/widget/ViewPager2;->y:Z

    .line 2
    iget-object p1, p0, Landroidx/viewpager2/widget/ViewPager2;->A:Landroidx/viewpager2/widget/ViewPager2$e;

    invoke-virtual {p1}, Landroidx/viewpager2/widget/ViewPager2$e;->i()V

    return-void
.end method
