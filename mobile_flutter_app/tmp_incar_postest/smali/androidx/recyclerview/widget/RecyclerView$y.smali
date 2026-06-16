.class public Landroidx/recyclerview/widget/RecyclerView$y;
.super Ljava/lang/Object;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "y"
.end annotation


# instance fields
.field public a:I

.field public b:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Z

.field public h:Z

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:Z

.field public m:I

.field public n:J

.field public o:I

.field public p:I

.field public q:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->a:I

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->c:I

    .line 4
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->d:I

    const/4 v1, 0x1

    .line 5
    iput v1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->e:I

    .line 6
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->f:I

    .line 7
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->g:Z

    .line 8
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->h:Z

    .line 9
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->i:Z

    .line 10
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->j:Z

    .line 11
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->k:Z

    .line 12
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->l:Z

    return-void
.end method


# virtual methods
.method public a()I
    .registers 3

    .line 10
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->h:Z

    if-eqz v0, :cond_a

    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->c:I

    iget v1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->d:I

    sub-int/2addr v0, v1

    goto :goto_c

    :cond_a
    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->f:I

    :goto_c
    return v0
.end method

.method public a(I)V
    .registers 5

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->e:I

    and-int/2addr v0, p1

    if-eqz v0, :cond_6

    return-void

    .line 2
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Layout state should be one of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " but it is "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->e:I

    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$g;)V
    .registers 3

    const/4 v0, 0x1

    .line 5
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->e:I

    .line 6
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$g;->b()I

    move-result p1

    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->f:I

    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->h:Z

    .line 8
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->i:Z

    .line 9
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->j:Z

    return-void
.end method

.method public b()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->a:I

    return v0
.end method

.method public c()Z
    .registers 3

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->a:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_7

    const/4 v0, 0x1

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    return v0
.end method

.method public d()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->h:Z

    return v0
.end method

.method public e()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$y;->l:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "State{mTargetPosition="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->a:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mData="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->b:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mItemCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->f:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mIsMeasuring="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->j:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mPreviousLayoutItemCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->c:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mDeletedInvisibleItemCountSincePreviousLayout="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->d:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mStructureChanged="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->g:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mInPreLayout="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->h:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mRunSimpleAnimations="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->k:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mRunPredictiveAnimations="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView$y;->l:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
