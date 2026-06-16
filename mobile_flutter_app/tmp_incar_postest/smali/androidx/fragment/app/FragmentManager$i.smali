.class public Landroidx/fragment/app/FragmentManager$i;
.super Ljava/lang/Object;
.source "FragmentManager.java"

# interfaces
.implements Lb/l/d/m;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/fragment/app/FragmentManager;->a(Lb/l/d/h;Lb/l/d/e;Landroidx/fragment/app/Fragment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Landroidx/fragment/app/Fragment;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V
    .registers 3

    .line 1
    iput-object p2, p0, Landroidx/fragment/app/FragmentManager$i;->h:Landroidx/fragment/app/Fragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V
    .registers 3

    .line 1
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager$i;->h:Landroidx/fragment/app/Fragment;

    invoke-virtual {p1, p2}, Landroidx/fragment/app/Fragment;->a(Landroidx/fragment/app/Fragment;)V

    return-void
.end method
