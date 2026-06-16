.class public Landroidx/fragment/app/FragmentManager$a;
.super Ljava/lang/Object;
.source "FragmentManager.java"

# interfaces
.implements Lb/a/e/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/fragment/app/FragmentManager;->a(Lb/l/d/h;Lb/l/d/e;Landroidx/fragment/app/Fragment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lb/a/e/a<",
        "Landroidx/activity/result/ActivityResult;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Landroidx/fragment/app/FragmentManager;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/FragmentManager;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/FragmentManager$a;->a:Landroidx/fragment/app/FragmentManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroidx/activity/result/ActivityResult;)V
    .registers 6

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager$a;->a:Landroidx/fragment/app/FragmentManager;

    iget-object v0, v0, Landroidx/fragment/app/FragmentManager;->C:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/FragmentManager$LaunchedFragmentInfo;

    const-string v1, "FragmentManager"

    if-nez v0, :cond_23

    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "No IntentSenders were started for "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 4
    :cond_23
    iget-object v2, v0, Landroidx/fragment/app/FragmentManager$LaunchedFragmentInfo;->h:Ljava/lang/String;

    .line 5
    iget v0, v0, Landroidx/fragment/app/FragmentManager$LaunchedFragmentInfo;->i:I

    .line 6
    iget-object v3, p0, Landroidx/fragment/app/FragmentManager$a;->a:Landroidx/fragment/app/FragmentManager;

    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->c(Landroidx/fragment/app/FragmentManager;)Lb/l/d/p;

    move-result-object v3

    invoke-virtual {v3, v2}, Lb/l/d/p;->d(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v3

    if-nez v3, :cond_48

    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Intent Sender result delivered for unknown Fragment "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 8
    :cond_48
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->f()I

    move-result v1

    .line 9
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->e()Landroid/content/Intent;

    move-result-object p1

    .line 10
    invoke-virtual {v3, v0, v1, p1}, Landroidx/fragment/app/Fragment;->a(IILandroid/content/Intent;)V

    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;)V
    .registers 2

    .line 1
    check-cast p1, Landroidx/activity/result/ActivityResult;

    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager$a;->a(Landroidx/activity/result/ActivityResult;)V

    return-void
.end method
