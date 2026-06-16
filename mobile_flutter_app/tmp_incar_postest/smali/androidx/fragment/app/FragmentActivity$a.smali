.class public Landroidx/fragment/app/FragmentActivity$a;
.super Ljava/lang/Object;
.source "FragmentActivity.java"

# interfaces
.implements Landroidx/savedstate/SavedStateRegistry$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/fragment/app/FragmentActivity;->m()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/fragment/app/FragmentActivity;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/FragmentActivity;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/FragmentActivity$a;->a:Landroidx/fragment/app/FragmentActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Landroid/os/Bundle;
    .registers 4

    .line 1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 2
    iget-object v1, p0, Landroidx/fragment/app/FragmentActivity$a;->a:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentActivity;->n()V

    .line 3
    iget-object v1, p0, Landroidx/fragment/app/FragmentActivity$a;->a:Landroidx/fragment/app/FragmentActivity;

    iget-object v1, v1, Landroidx/fragment/app/FragmentActivity;->q:Lb/n/i;

    sget-object v2, Lb/n/e$b;->ON_STOP:Lb/n/e$b;

    invoke-virtual {v1, v2}, Lb/n/i;->a(Lb/n/e$b;)V

    .line 4
    iget-object v1, p0, Landroidx/fragment/app/FragmentActivity$a;->a:Landroidx/fragment/app/FragmentActivity;

    iget-object v1, v1, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v1}, Lb/l/d/f;->l()Landroid/os/Parcelable;

    move-result-object v1

    if-eqz v1, :cond_22

    const-string v2, "android:support:fragments"

    .line 5
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_22
    return-object v0
.end method
