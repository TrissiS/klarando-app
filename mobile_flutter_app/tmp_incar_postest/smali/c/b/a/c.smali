.class public Lc/b/a/c;
.super Ljava/lang/Object;
.source "BarParams.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public A:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field public B:F

.field public C:Z

.field public D:Landroid/view/View;

.field public E:Landroid/view/View;

.field public F:Z

.field public G:I

.field public H:I

.field public I:Z

.field public J:Z

.field public K:I

.field public L:Z

.field public M:Z

.field public N:Z

.field public O:Z

.field public P:Lc/b/a/o;

.field public Q:Lc/b/a/p;

.field public R:Lc/b/a/n;

.field public h:I

.field public i:I

.field public j:I

.field public k:F

.field public l:F

.field public m:F

.field public n:F

.field public o:Z

.field public p:Z

.field public q:Lc/b/a/b;

.field public r:Z

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:F

.field public w:F

.field public x:Z

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>()V
    .registers 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lc/b/a/c;->h:I

    const/high16 v1, -0x1000000

    .line 3
    iput v1, p0, Lc/b/a/c;->i:I

    .line 4
    iput v1, p0, Lc/b/a/c;->j:I

    const/4 v2, 0x0

    .line 5
    iput v2, p0, Lc/b/a/c;->k:F

    .line 6
    iput v2, p0, Lc/b/a/c;->l:F

    .line 7
    iput v2, p0, Lc/b/a/c;->m:F

    .line 8
    iput v2, p0, Lc/b/a/c;->n:F

    .line 9
    iput-boolean v0, p0, Lc/b/a/c;->o:Z

    .line 10
    iput-boolean v0, p0, Lc/b/a/c;->p:Z

    .line 11
    sget-object v3, Lc/b/a/b;->FLAG_SHOW_BAR:Lc/b/a/b;

    iput-object v3, p0, Lc/b/a/c;->q:Lc/b/a/b;

    .line 12
    iput-boolean v0, p0, Lc/b/a/c;->r:Z

    .line 13
    iput-boolean v0, p0, Lc/b/a/c;->s:Z

    .line 14
    iput-boolean v0, p0, Lc/b/a/c;->t:Z

    .line 15
    iput-boolean v0, p0, Lc/b/a/c;->u:Z

    .line 16
    iput v2, p0, Lc/b/a/c;->v:F

    .line 17
    iput v2, p0, Lc/b/a/c;->w:F

    const/4 v3, 0x1

    .line 18
    iput-boolean v3, p0, Lc/b/a/c;->x:Z

    .line 19
    iput v1, p0, Lc/b/a/c;->y:I

    .line 20
    iput v1, p0, Lc/b/a/c;->z:I

    .line 21
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lc/b/a/c;->A:Ljava/util/Map;

    .line 22
    iput v2, p0, Lc/b/a/c;->B:F

    .line 23
    iput-boolean v0, p0, Lc/b/a/c;->C:Z

    .line 24
    iput-boolean v3, p0, Lc/b/a/c;->F:Z

    .line 25
    iput-boolean v0, p0, Lc/b/a/c;->I:Z

    .line 26
    iput-boolean v0, p0, Lc/b/a/c;->J:Z

    const/16 v0, 0x12

    .line 27
    iput v0, p0, Lc/b/a/c;->K:I

    .line 28
    iput-boolean v3, p0, Lc/b/a/c;->L:Z

    .line 29
    iput-boolean v3, p0, Lc/b/a/c;->M:Z

    .line 30
    iput-boolean v3, p0, Lc/b/a/c;->N:Z

    .line 31
    iput-boolean v3, p0, Lc/b/a/c;->O:Z

    return-void
.end method


# virtual methods
.method public clone()Lc/b/a/c;
    .registers 2

    .line 2
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/b/a/c;
    :try_end_6
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_6} :catch_7

    goto :goto_8

    :catch_7
    const/4 v0, 0x0

    :goto_8
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lc/b/a/c;->clone()Lc/b/a/c;

    move-result-object v0

    return-object v0
.end method
