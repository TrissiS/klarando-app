.class public Lb/l/d/r$e;
.super Ljava/lang/Object;
.source "FragmentTransition.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/r;->b(Lb/l/d/t;Landroid/view/ViewGroup;Landroid/view/View;Lb/e/a;Lb/l/d/r$h;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Landroidx/fragment/app/Fragment;

.field public final synthetic i:Landroidx/fragment/app/Fragment;

.field public final synthetic j:Z

.field public final synthetic k:Lb/e/a;

.field public final synthetic l:Landroid/view/View;

.field public final synthetic m:Lb/l/d/t;

.field public final synthetic n:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLb/e/a;Landroid/view/View;Lb/l/d/t;Landroid/graphics/Rect;)V
    .registers 8

    .line 1
    iput-object p1, p0, Lb/l/d/r$e;->h:Landroidx/fragment/app/Fragment;

    iput-object p2, p0, Lb/l/d/r$e;->i:Landroidx/fragment/app/Fragment;

    iput-boolean p3, p0, Lb/l/d/r$e;->j:Z

    iput-object p4, p0, Lb/l/d/r$e;->k:Lb/e/a;

    iput-object p5, p0, Lb/l/d/r$e;->l:Landroid/view/View;

    iput-object p6, p0, Lb/l/d/r$e;->m:Lb/l/d/t;

    iput-object p7, p0, Lb/l/d/r$e;->n:Landroid/graphics/Rect;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 1
    iget-object v0, p0, Lb/l/d/r$e;->h:Landroidx/fragment/app/Fragment;

    iget-object v1, p0, Lb/l/d/r$e;->i:Landroidx/fragment/app/Fragment;

    iget-boolean v2, p0, Lb/l/d/r$e;->j:Z

    iget-object v3, p0, Lb/l/d/r$e;->k:Lb/e/a;

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Lb/l/d/r;->a(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLb/e/a;Z)V

    .line 2
    iget-object v0, p0, Lb/l/d/r$e;->l:Landroid/view/View;

    if-eqz v0, :cond_17

    .line 3
    iget-object v1, p0, Lb/l/d/r$e;->m:Lb/l/d/t;

    iget-object v2, p0, Lb/l/d/r$e;->n:Landroid/graphics/Rect;

    invoke-virtual {v1, v0, v2}, Lb/l/d/t;->a(Landroid/view/View;Landroid/graphics/Rect;)V

    :cond_17
    return-void
.end method
