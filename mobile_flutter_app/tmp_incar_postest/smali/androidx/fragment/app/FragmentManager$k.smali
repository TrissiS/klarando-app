.class public Landroidx/fragment/app/FragmentManager$k;
.super Lb/a/e/e/a;
.source "FragmentManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/fragment/app/FragmentManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "k"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lb/a/e/e/a<",
        "Landroidx/activity/result/IntentSenderRequest;",
        "Landroidx/activity/result/ActivityResult;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lb/a/e/e/a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(ILandroid/content/Intent;)Landroidx/activity/result/ActivityResult;
    .registers 4

    .line 2
    new-instance v0, Landroidx/activity/result/ActivityResult;

    invoke-direct {v0, p1, p2}, Landroidx/activity/result/ActivityResult;-><init>(ILandroid/content/Intent;)V

    return-object v0
.end method

.method public bridge synthetic a(ILandroid/content/Intent;)Ljava/lang/Object;
    .registers 3

    .line 1
    invoke-virtual {p0, p1, p2}, Landroidx/fragment/app/FragmentManager$k;->a(ILandroid/content/Intent;)Landroidx/activity/result/ActivityResult;

    move-result-object p1

    return-object p1
.end method
