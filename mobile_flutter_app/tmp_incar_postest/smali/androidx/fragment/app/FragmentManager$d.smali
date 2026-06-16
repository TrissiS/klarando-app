.class public Landroidx/fragment/app/FragmentManager$d;
.super Ljava/lang/Object;
.source "FragmentManager.java"

# interfaces
.implements Lb/l/d/r$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/fragment/app/FragmentManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/fragment/app/FragmentManager;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/FragmentManager;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/FragmentManager$d;->a:Landroidx/fragment/app/FragmentManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroidx/fragment/app/Fragment;Lb/h/i/b;)V
    .registers 4

    .line 1
    invoke-virtual {p2}, Lb/h/i/b;->b()Z

    move-result v0

    if-nez v0, :cond_b

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager$d;->a:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1, p2}, Landroidx/fragment/app/FragmentManager;->b(Landroidx/fragment/app/Fragment;Lb/h/i/b;)V

    :cond_b
    return-void
.end method

.method public b(Landroidx/fragment/app/Fragment;Lb/h/i/b;)V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager$d;->a:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1, p2}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/Fragment;Lb/h/i/b;)V

    return-void
.end method
