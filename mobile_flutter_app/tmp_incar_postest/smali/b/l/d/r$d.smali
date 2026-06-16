.class public Lb/l/d/r$d;
.super Ljava/lang/Object;
.source "FragmentTransition.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/r;->a(Lb/l/d/t;Landroid/view/ViewGroup;Landroidx/fragment/app/Fragment;Landroid/view/View;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Ljava/lang/Object;

.field public final synthetic i:Lb/l/d/t;

.field public final synthetic j:Landroid/view/View;

.field public final synthetic k:Landroidx/fragment/app/Fragment;

.field public final synthetic l:Ljava/util/ArrayList;

.field public final synthetic m:Ljava/util/ArrayList;

.field public final synthetic n:Ljava/util/ArrayList;

.field public final synthetic o:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lb/l/d/t;Landroid/view/View;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;)V
    .registers 9

    .line 1
    iput-object p1, p0, Lb/l/d/r$d;->h:Ljava/lang/Object;

    iput-object p2, p0, Lb/l/d/r$d;->i:Lb/l/d/t;

    iput-object p3, p0, Lb/l/d/r$d;->j:Landroid/view/View;

    iput-object p4, p0, Lb/l/d/r$d;->k:Landroidx/fragment/app/Fragment;

    iput-object p5, p0, Lb/l/d/r$d;->l:Ljava/util/ArrayList;

    iput-object p6, p0, Lb/l/d/r$d;->m:Ljava/util/ArrayList;

    iput-object p7, p0, Lb/l/d/r$d;->n:Ljava/util/ArrayList;

    iput-object p8, p0, Lb/l/d/r$d;->o:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 1
    iget-object v0, p0, Lb/l/d/r$d;->h:Ljava/lang/Object;

    if-eqz v0, :cond_1e

    .line 2
    iget-object v1, p0, Lb/l/d/r$d;->i:Lb/l/d/t;

    iget-object v2, p0, Lb/l/d/r$d;->j:Landroid/view/View;

    invoke-virtual {v1, v0, v2}, Lb/l/d/t;->b(Ljava/lang/Object;Landroid/view/View;)V

    .line 3
    iget-object v0, p0, Lb/l/d/r$d;->i:Lb/l/d/t;

    iget-object v1, p0, Lb/l/d/r$d;->h:Ljava/lang/Object;

    iget-object v2, p0, Lb/l/d/r$d;->k:Landroidx/fragment/app/Fragment;

    iget-object v3, p0, Lb/l/d/r$d;->l:Ljava/util/ArrayList;

    iget-object v4, p0, Lb/l/d/r$d;->j:Landroid/view/View;

    invoke-static {v0, v1, v2, v3, v4}, Lb/l/d/r;->a(Lb/l/d/t;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;Landroid/view/View;)Ljava/util/ArrayList;

    move-result-object v0

    .line 4
    iget-object v1, p0, Lb/l/d/r$d;->m:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 5
    :cond_1e
    iget-object v0, p0, Lb/l/d/r$d;->n:Ljava/util/ArrayList;

    if-eqz v0, :cond_45

    .line 6
    iget-object v0, p0, Lb/l/d/r$d;->o:Ljava/lang/Object;

    if-eqz v0, :cond_39

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    iget-object v1, p0, Lb/l/d/r$d;->j:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    iget-object v1, p0, Lb/l/d/r$d;->i:Lb/l/d/t;

    iget-object v2, p0, Lb/l/d/r$d;->o:Ljava/lang/Object;

    iget-object v3, p0, Lb/l/d/r$d;->n:Ljava/util/ArrayList;

    invoke-virtual {v1, v2, v3, v0}, Lb/l/d/t;->a(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 10
    :cond_39
    iget-object v0, p0, Lb/l/d/r$d;->n:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 11
    iget-object v0, p0, Lb/l/d/r$d;->n:Ljava/util/ArrayList;

    iget-object v1, p0, Lb/l/d/r$d;->j:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_45
    return-void
.end method
