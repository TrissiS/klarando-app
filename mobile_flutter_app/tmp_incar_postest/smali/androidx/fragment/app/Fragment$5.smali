.class public Landroidx/fragment/app/Fragment$5;
.super Ljava/lang/Object;
.source "Fragment.java"

# interfaces
.implements Lb/n/f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/fragment/app/Fragment;->h(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/fragment/app/Fragment;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/Fragment;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/Fragment$5;->a:Landroidx/fragment/app/Fragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/n/h;Lb/n/e$b;)V
    .registers 3

    .line 1
    sget-object p1, Lb/n/e$b;->ON_STOP:Lb/n/e$b;

    if-ne p2, p1, :cond_d

    .line 2
    iget-object p1, p0, Landroidx/fragment/app/Fragment$5;->a:Landroidx/fragment/app/Fragment;

    iget-object p1, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz p1, :cond_d

    .line 3
    invoke-virtual {p1}, Landroid/view/View;->cancelPendingInputEvents()V

    :cond_d
    return-void
.end method
