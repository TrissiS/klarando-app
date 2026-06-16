.class public final Ld/a/b/f/b/j;
.super Ld/a/b/d/b;
.source "SelectDialog.java"

# interfaces
.implements Ld/a/a/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ld/a/b/f/b/j$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ld/a/b/d/b<",
        "Ljava/lang/Object;",
        ">;",
        "Ld/a/a/c$c;"
    }
.end annotation


# instance fields
.field public r:I

.field public s:I

.field public final t:Ljava/util/HashMap;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UseSparseArrays"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 2
    invoke-direct {p0, p1}, Ld/a/b/d/b;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    .line 3
    iput p1, p0, Ld/a/b/f/b/j;->r:I

    const p1, 0x7fffffff

    .line 4
    iput p1, p0, Ld/a/b/f/b/j;->s:I

    .line 5
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Ld/a/b/f/b/j;->t:Ljava/util/HashMap;

    .line 6
    invoke-virtual {p0, p0}, Ld/a/a/c;->a(Ld/a/a/c$c;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ld/a/b/f/b/g;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Ld/a/b/f/b/j;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Ld/a/b/f/b/j;)V
    .registers 1

    .line 2
    invoke-virtual {p0}, Ld/a/b/f/b/j;->l()V

    return-void
.end method

.method public static synthetic a(Ld/a/b/f/b/j;[I)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Ld/a/b/f/b/j;->a([I)V

    return-void
.end method

.method public static synthetic b(Ld/a/b/f/b/j;)Ljava/util/HashMap;
    .registers 1

    .line 1
    invoke-virtual {p0}, Ld/a/b/f/b/j;->j()Ljava/util/HashMap;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ld/a/b/f/b/j;)I
    .registers 1

    .line 1
    invoke-virtual {p0}, Ld/a/b/f/b/j;->i()I

    move-result p0

    return p0
.end method

.method public static synthetic d(Ld/a/b/f/b/j;)Ljava/util/HashMap;
    .registers 1

    .line 1
    iget-object p0, p0, Ld/a/b/f/b/j;->t:Ljava/util/HashMap;

    return-object p0
.end method

.method public static synthetic e(Ld/a/b/f/b/j;)I
    .registers 1

    .line 1
    iget p0, p0, Ld/a/b/f/b/j;->s:I

    return p0
.end method


# virtual methods
.method public a(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)V
    .registers 5

    .line 6
    iget-object p1, p0, Ld/a/b/f/b/j;->t:Ljava/util/HashMap;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1f

    .line 7
    invoke-virtual {p0}, Ld/a/b/f/b/j;->k()Z

    move-result p1

    if-nez p1, :cond_60

    .line 8
    iget-object p1, p0, Ld/a/b/f/b/j;->t:Ljava/util/HashMap;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    invoke-virtual {p0, p3}, Landroidx/recyclerview/widget/RecyclerView$g;->d(I)V

    goto :goto_60

    .line 10
    :cond_1f
    iget p1, p0, Ld/a/b/f/b/j;->s:I

    const/4 p2, 0x1

    if-ne p1, p2, :cond_2c

    .line 11
    iget-object p1, p0, Ld/a/b/f/b/j;->t:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    .line 12
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$g;->f()V

    .line 13
    :cond_2c
    iget-object p1, p0, Ld/a/b/f/b/j;->t:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result p1

    iget v0, p0, Ld/a/b/f/b/j;->s:I

    if-ge p1, v0, :cond_47

    .line 14
    iget-object p1, p0, Ld/a/b/f/b/j;->t:Ljava/util/HashMap;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p3}, Ld/a/b/d/b;->e(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    invoke-virtual {p0, p3}, Landroidx/recyclerview/widget/RecyclerView$g;->d(I)V

    goto :goto_60

    :cond_47
    const p1, 0x7f0f00fd

    .line 16
    invoke-interface {p0, p1}, Ld/a/a/g/k;->a(I)Ljava/lang/String;

    move-result-object p1

    new-array p2, p2, [Ljava/lang/Object;

    const/4 p3, 0x0

    iget v0, p0, Ld/a/b/f/b/j;->s:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, p2, p3

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lc/c/d/i;->a(Ljava/lang/CharSequence;)V

    :cond_60
    :goto_60
    return-void
.end method

.method public final varargs a([I)V
    .registers 7

    .line 3
    array-length v0, p1

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v0, :cond_16

    aget v2, p1, v1

    .line 4
    iget-object v3, p0, Ld/a/b/f/b/j;->t:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, v2}, Ld/a/b/d/b;->e(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 5
    :cond_16
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$g;->f()V

    return-void
.end method

.method public bridge synthetic b(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$b0;
    .registers 3

    .line 2
    invoke-virtual {p0, p1, p2}, Ld/a/b/f/b/j;->b(Landroid/view/ViewGroup;I)Ld/a/b/f/b/j$a;

    move-result-object p1

    return-object p1
.end method

.method public b(Landroid/view/ViewGroup;I)Ld/a/b/f/b/j$a;
    .registers 3

    .line 3
    new-instance p1, Ld/a/b/f/b/j$a;

    invoke-direct {p1, p0}, Ld/a/b/f/b/j$a;-><init>(Ld/a/b/f/b/j;)V

    return-object p1
.end method

.method public final f(I)V
    .registers 2

    .line 1
    iput p1, p0, Ld/a/b/f/b/j;->s:I

    return-void
.end method

.method public final g(I)V
    .registers 2

    .line 1
    iput p1, p0, Ld/a/b/f/b/j;->r:I

    return-void
.end method

.method public final i()I
    .registers 2

    .line 1
    iget v0, p0, Ld/a/b/f/b/j;->r:I

    return v0
.end method

.method public final j()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/b/f/b/j;->t:Ljava/util/HashMap;

    return-object v0
.end method

.method public final k()Z
    .registers 3

    .line 1
    iget v0, p0, Ld/a/b/f/b/j;->s:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_a

    iget v0, p0, Ld/a/b/f/b/j;->r:I

    if-ne v0, v1, :cond_a

    goto :goto_b

    :cond_a
    const/4 v1, 0x0

    :goto_b
    return v1
.end method

.method public final l()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, v0}, Ld/a/b/f/b/j;->f(I)V

    .line 2
    invoke-virtual {p0, v0}, Ld/a/b/f/b/j;->g(I)V

    return-void
.end method
