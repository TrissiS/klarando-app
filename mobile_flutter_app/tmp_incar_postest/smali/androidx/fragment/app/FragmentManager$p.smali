.class public Landroidx/fragment/app/FragmentManager$p;
.super Ljava/lang/Object;
.source "FragmentManager.java"

# interfaces
.implements Landroidx/fragment/app/Fragment$h;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/fragment/app/FragmentManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "p"
.end annotation


# instance fields
.field public final a:Z

.field public final b:Lb/l/d/a;

.field public c:I


# direct methods
.method public constructor <init>(Lb/l/d/a;Z)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-boolean p2, p0, Landroidx/fragment/app/FragmentManager$p;->a:Z

    .line 3
    iput-object p1, p0, Landroidx/fragment/app/FragmentManager$p;->b:Lb/l/d/a;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    .line 1
    iget v0, p0, Landroidx/fragment/app/FragmentManager$p;->c:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroidx/fragment/app/FragmentManager$p;->c:I

    if-eqz v0, :cond_9

    return-void

    .line 2
    :cond_9
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager$p;->b:Lb/l/d/a;

    iget-object v0, v0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->O()V

    return-void
.end method

.method public b()V
    .registers 2

    .line 1
    iget v0, p0, Landroidx/fragment/app/FragmentManager$p;->c:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroidx/fragment/app/FragmentManager$p;->c:I

    return-void
.end method

.method public c()V
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager$p;->b:Lb/l/d/a;

    iget-object v1, v0, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    iget-boolean v2, p0, Landroidx/fragment/app/FragmentManager$p;->a:Z

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3, v3}, Landroidx/fragment/app/FragmentManager;->a(Lb/l/d/a;ZZZ)V

    return-void
.end method

.method public d()V
    .registers 6

    .line 1
    iget v0, p0, Landroidx/fragment/app/FragmentManager$p;->c:I

    const/4 v1, 0x1

    if-lez v0, :cond_7

    const/4 v0, 0x1

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    .line 2
    :goto_8
    iget-object v2, p0, Landroidx/fragment/app/FragmentManager$p;->b:Lb/l/d/a;

    iget-object v2, v2, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    .line 3
    invoke-virtual {v2}, Landroidx/fragment/app/FragmentManager;->A()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_14
    :goto_14
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_30

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/Fragment;

    const/4 v4, 0x0

    .line 4
    invoke-virtual {v3, v4}, Landroidx/fragment/app/Fragment;->a(Landroidx/fragment/app/Fragment$h;)V

    if-eqz v0, :cond_14

    .line 5
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->U()Z

    move-result v4

    if-eqz v4, :cond_14

    .line 6
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->w0()V

    goto :goto_14

    .line 7
    :cond_30
    iget-object v2, p0, Landroidx/fragment/app/FragmentManager$p;->b:Lb/l/d/a;

    iget-object v3, v2, Lb/l/d/a;->q:Landroidx/fragment/app/FragmentManager;

    iget-boolean v4, p0, Landroidx/fragment/app/FragmentManager$p;->a:Z

    xor-int/2addr v0, v1

    invoke-virtual {v3, v2, v4, v0, v1}, Landroidx/fragment/app/FragmentManager;->a(Lb/l/d/a;ZZZ)V

    return-void
.end method

.method public e()Z
    .registers 2

    .line 1
    iget v0, p0, Landroidx/fragment/app/FragmentManager$p;->c:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method
