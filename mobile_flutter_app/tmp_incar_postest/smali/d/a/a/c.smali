.class public abstract Ld/a/a/c;
.super Landroidx/recyclerview/widget/RecyclerView$g;
.source "BaseAdapter.java"

# interfaces
.implements Ld/a/a/g/k;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ld/a/a/c$b;,
        Ld/a/a/c$a;,
        Ld/a/a/c$d;,
        Ld/a/a/c$c;,
        Ld/a/a/c$e;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<VH:",
        "Ld/a/a/c<",
        "*>.e;>",
        "Landroidx/recyclerview/widget/RecyclerView$g<",
        "TVH;>;",
        "Ld/a/a/g/k;"
    }
.end annotation


# instance fields
.field public final j:Landroid/content/Context;

.field public k:Landroidx/recyclerview/widget/RecyclerView;

.field public l:Ld/a/a/c$c;

.field public m:Ld/a/a/c$d;

.field public n:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ld/a/a/c$a;",
            ">;"
        }
    .end annotation
.end field

.field public o:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ld/a/a/c$b;",
            ">;"
        }
    .end annotation
.end field

.field public p:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$g;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ld/a/a/c;->p:I

    .line 3
    iput-object p1, p0, Ld/a/a/c;->j:Landroid/content/Context;

    if-eqz p1, :cond_b

    return-void

    .line 4
    :cond_b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "are you ok?"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic a(Ld/a/a/c;)Landroidx/recyclerview/widget/RecyclerView;
    .registers 1

    .line 1
    iget-object p0, p0, Ld/a/a/c;->k:Landroidx/recyclerview/widget/RecyclerView;

    return-object p0
.end method

.method public static synthetic b(Ld/a/a/c;)Ld/a/a/c$c;
    .registers 1

    .line 1
    iget-object p0, p0, Ld/a/a/c;->l:Ld/a/a/c$c;

    return-object p0
.end method

.method public static synthetic c(Ld/a/a/c;)Ld/a/a/c$d;
    .registers 1

    .line 1
    iget-object p0, p0, Ld/a/a/c;->m:Ld/a/a/c$d;

    return-object p0
.end method

.method public static synthetic d(Ld/a/a/c;)Landroid/util/SparseArray;
    .registers 1

    .line 1
    iget-object p0, p0, Ld/a/a/c;->n:Landroid/util/SparseArray;

    return-object p0
.end method

.method public static synthetic e(Ld/a/a/c;)Landroid/util/SparseArray;
    .registers 1

    .line 1
    iget-object p0, p0, Ld/a/a/c;->o:Landroid/util/SparseArray;

    return-object p0
.end method

.method public static synthetic f(Ld/a/a/c;)I
    .registers 1

    .line 1
    iget p0, p0, Ld/a/a/c;->p:I

    return p0
.end method


# virtual methods
.method public a(Landroid/content/Context;)Landroidx/recyclerview/widget/RecyclerView$o;
    .registers 3

    .line 8
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public synthetic a(I)Ljava/lang/String;
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/j;->a(Ld/a/a/g/k;I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    .line 4
    iput-object p1, p0, Ld/a/a/c;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object p1

    if-nez p1, :cond_15

    .line 6
    iget-object p1, p0, Ld/a/a/c;->j:Landroid/content/Context;

    invoke-virtual {p0, p1}, Ld/a/a/c;->a(Landroid/content/Context;)Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object p1

    if-eqz p1, :cond_15

    .line 7
    iget-object v0, p0, Ld/a/a/c;->k:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    :cond_15
    return-void
.end method

.method public a(Ld/a/a/c$c;)V
    .registers 2

    .line 9
    invoke-virtual {p0}, Ld/a/a/c;->g()V

    .line 10
    iput-object p1, p0, Ld/a/a/c;->l:Ld/a/a/c$c;

    return-void
.end method

.method public final a(Ld/a/a/c$e;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TVH;I)V"
        }
    .end annotation

    .line 2
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->g()I

    move-result v0

    sub-int v0, p2, v0

    iput v0, p0, Ld/a/a/c;->p:I

    .line 3
    invoke-virtual {p1, p2}, Ld/a/a/c$e;->c(I)V

    return-void
.end method

.method public synthetic b(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TS;>;)TS;"
        }
    .end annotation

    invoke-static {p0, p1}, Ld/a/a/g/j;->a(Ld/a/a/g/k;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic b(Landroidx/recyclerview/widget/RecyclerView$b0;I)V
    .registers 3

    .line 2
    check-cast p1, Ld/a/a/c$e;

    invoke-virtual {p0, p1, p2}, Ld/a/a/c;->a(Ld/a/a/c$e;I)V

    return-void
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    const/4 p1, 0x0

    .line 3
    iput-object p1, p0, Ld/a/a/c;->k:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method

.method public synthetic d()Landroid/content/res/Resources;
    .registers 2

    invoke-static {p0}, Ld/a/a/g/j;->a(Ld/a/a/g/k;)Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method public final g()V
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/a/c;->k:Landroidx/recyclerview/widget/RecyclerView;

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "are you ok?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/a/c;->j:Landroid/content/Context;

    return-object v0
.end method
