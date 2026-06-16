.class public Lb/l/d/r$f;
.super Ljava/lang/Object;
.source "FragmentTransition.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/r;->a(Lb/l/d/t;Landroid/view/ViewGroup;Landroid/view/View;Lb/e/a;Lb/l/d/r$h;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/l/d/t;

.field public final synthetic i:Lb/e/a;

.field public final synthetic j:Ljava/lang/Object;

.field public final synthetic k:Lb/l/d/r$h;

.field public final synthetic l:Ljava/util/ArrayList;

.field public final synthetic m:Landroid/view/View;

.field public final synthetic n:Landroidx/fragment/app/Fragment;

.field public final synthetic o:Landroidx/fragment/app/Fragment;

.field public final synthetic p:Z

.field public final synthetic q:Ljava/util/ArrayList;

.field public final synthetic r:Ljava/lang/Object;

.field public final synthetic s:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Lb/l/d/t;Lb/e/a;Ljava/lang/Object;Lb/l/d/r$h;Ljava/util/ArrayList;Landroid/view/View;Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLjava/util/ArrayList;Ljava/lang/Object;Landroid/graphics/Rect;)V
    .registers 13

    .line 1
    iput-object p1, p0, Lb/l/d/r$f;->h:Lb/l/d/t;

    iput-object p2, p0, Lb/l/d/r$f;->i:Lb/e/a;

    iput-object p3, p0, Lb/l/d/r$f;->j:Ljava/lang/Object;

    iput-object p4, p0, Lb/l/d/r$f;->k:Lb/l/d/r$h;

    iput-object p5, p0, Lb/l/d/r$f;->l:Ljava/util/ArrayList;

    iput-object p6, p0, Lb/l/d/r$f;->m:Landroid/view/View;

    iput-object p7, p0, Lb/l/d/r$f;->n:Landroidx/fragment/app/Fragment;

    iput-object p8, p0, Lb/l/d/r$f;->o:Landroidx/fragment/app/Fragment;

    iput-boolean p9, p0, Lb/l/d/r$f;->p:Z

    iput-object p10, p0, Lb/l/d/r$f;->q:Ljava/util/ArrayList;

    iput-object p11, p0, Lb/l/d/r$f;->r:Ljava/lang/Object;

    iput-object p12, p0, Lb/l/d/r$f;->s:Landroid/graphics/Rect;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 1
    iget-object v0, p0, Lb/l/d/r$f;->h:Lb/l/d/t;

    iget-object v1, p0, Lb/l/d/r$f;->i:Lb/e/a;

    iget-object v2, p0, Lb/l/d/r$f;->j:Ljava/lang/Object;

    iget-object v3, p0, Lb/l/d/r$f;->k:Lb/l/d/r$h;

    invoke-static {v0, v1, v2, v3}, Lb/l/d/r;->a(Lb/l/d/t;Lb/e/a;Ljava/lang/Object;Lb/l/d/r$h;)Lb/e/a;

    move-result-object v0

    if-eqz v0, :cond_1e

    .line 2
    iget-object v1, p0, Lb/l/d/r$f;->l:Ljava/util/ArrayList;

    invoke-virtual {v0}, Lb/e/a;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 3
    iget-object v1, p0, Lb/l/d/r$f;->l:Ljava/util/ArrayList;

    iget-object v2, p0, Lb/l/d/r$f;->m:Landroid/view/View;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    :cond_1e
    iget-object v1, p0, Lb/l/d/r$f;->n:Landroidx/fragment/app/Fragment;

    iget-object v2, p0, Lb/l/d/r$f;->o:Landroidx/fragment/app/Fragment;

    iget-boolean v3, p0, Lb/l/d/r$f;->p:Z

    const/4 v4, 0x0

    invoke-static {v1, v2, v3, v0, v4}, Lb/l/d/r;->a(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLb/e/a;Z)V

    .line 5
    iget-object v1, p0, Lb/l/d/r$f;->j:Ljava/lang/Object;

    if-eqz v1, :cond_48

    .line 6
    iget-object v2, p0, Lb/l/d/r$f;->h:Lb/l/d/t;

    iget-object v3, p0, Lb/l/d/r$f;->q:Ljava/util/ArrayList;

    iget-object v4, p0, Lb/l/d/r$f;->l:Ljava/util/ArrayList;

    invoke-virtual {v2, v1, v3, v4}, Lb/l/d/t;->b(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 7
    iget-object v1, p0, Lb/l/d/r$f;->k:Lb/l/d/r$h;

    iget-object v2, p0, Lb/l/d/r$f;->r:Ljava/lang/Object;

    iget-boolean v3, p0, Lb/l/d/r$f;->p:Z

    invoke-static {v0, v1, v2, v3}, Lb/l/d/r;->a(Lb/e/a;Lb/l/d/r$h;Ljava/lang/Object;Z)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_48

    .line 8
    iget-object v1, p0, Lb/l/d/r$f;->h:Lb/l/d/t;

    iget-object v2, p0, Lb/l/d/r$f;->s:Landroid/graphics/Rect;

    invoke-virtual {v1, v0, v2}, Lb/l/d/t;->a(Landroid/view/View;Landroid/graphics/Rect;)V

    :cond_48
    return-void
.end method
