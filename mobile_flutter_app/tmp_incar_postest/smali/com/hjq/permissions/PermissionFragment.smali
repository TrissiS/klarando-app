.class public final Lcom/hjq/permissions/PermissionFragment;
.super Landroid/app/Fragment;
.source "PermissionFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x17
.end annotation


# static fields
.field public static final n:Landroid/util/ArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArraySet<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public h:Z

.field public i:Z

.field public j:Z

.field public k:Lc/c/b/b;

.field public l:Lc/c/b/a;

.field public m:I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    sput-object v0, Lcom/hjq/permissions/PermissionFragment;->n:Landroid/util/ArraySet;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method

.method public static a(Landroid/app/Activity;Ljava/util/ArrayList;Lc/c/b/a;Lc/c/b/b;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Lc/c/b/a;",
            "Lc/c/b/b;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/hjq/permissions/PermissionFragment;

    invoke-direct {v0}, Lcom/hjq/permissions/PermissionFragment;-><init>()V

    .line 2
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 3
    :cond_a
    invoke-static {}, Lc/c/b/e;->a()I

    move-result v2

    .line 4
    sget-object v3, Lcom/hjq/permissions/PermissionFragment;->n:Landroid/util/ArraySet;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    .line 5
    sget-object v3, Lcom/hjq/permissions/PermissionFragment;->n:Landroid/util/ArraySet;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    const-string v3, "request_code"

    .line 6
    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "request_permissions"

    .line 7
    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 8
    invoke-virtual {v0, v1}, Landroid/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 9
    invoke-virtual {v0, p1}, Landroid/app/Fragment;->setRetainInstance(Z)V

    .line 10
    invoke-virtual {v0, p1}, Lcom/hjq/permissions/PermissionFragment;->a(Z)V

    .line 11
    invoke-virtual {v0, p3}, Lcom/hjq/permissions/PermissionFragment;->a(Lc/c/b/b;)V

    .line 12
    invoke-virtual {v0, p2}, Lcom/hjq/permissions/PermissionFragment;->a(Lc/c/b/a;)V

    .line 13
    invoke-virtual {v0, p0}, Lcom/hjq/permissions/PermissionFragment;->a(Landroid/app/Activity;)V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 9

    .line 18
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 19
    invoke-virtual {p0}, Landroid/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v0, :cond_80

    if-nez v1, :cond_e

    goto/16 :goto_80

    :cond_e
    const-string v2, "request_code"

    .line 20
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    const-string v4, "request_permissions"

    .line 21
    invoke-virtual {v1, v4}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_80

    .line 22
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_23

    goto :goto_80

    .line 23
    :cond_23
    invoke-static {}, Lc/c/b/e;->b()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_4e

    const-string v4, "android.permission.ACCESS_BACKGROUND_LOCATION"

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    .line 24
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const-string v6, "android.permission.ACCESS_COARSE_LOCATION"

    .line 25
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_42

    .line 26
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_42
    const-string v6, "android.permission.ACCESS_FINE_LOCATION"

    .line 27
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4f

    .line 28
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4f

    :cond_4e
    move-object v4, v5

    .line 29
    :cond_4f
    :goto_4f
    invoke-static {}, Lc/c/b/e;->b()Z

    move-result v6

    if-eqz v6, :cond_67

    if-eqz v4, :cond_67

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_5e

    goto :goto_67

    .line 30
    :cond_5e
    new-instance v2, Lcom/hjq/permissions/PermissionFragment$a;

    invoke-direct {v2, p0, v0, v1, v3}, Lcom/hjq/permissions/PermissionFragment$a;-><init>(Lcom/hjq/permissions/PermissionFragment;Landroid/app/Activity;Ljava/util/ArrayList;I)V

    invoke-static {v0, v4, v5, v2}, Lcom/hjq/permissions/PermissionFragment;->a(Landroid/app/Activity;Ljava/util/ArrayList;Lc/c/b/a;Lc/c/b/b;)V

    return-void

    .line 31
    :cond_67
    :goto_67
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Landroid/app/Fragment;->requestPermissions([Ljava/lang/String;I)V

    :cond_80
    :goto_80
    return-void
.end method

.method public a(Landroid/app/Activity;)V
    .registers 3

    .line 14
    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p0}, Landroid/app/Fragment;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    return-void
.end method

.method public a(Lc/c/b/a;)V
    .registers 2

    .line 17
    iput-object p1, p0, Lcom/hjq/permissions/PermissionFragment;->l:Lc/c/b/a;

    return-void
.end method

.method public a(Lc/c/b/b;)V
    .registers 2

    .line 15
    iput-object p1, p0, Lcom/hjq/permissions/PermissionFragment;->k:Lc/c/b/b;

    return-void
.end method

.method public a(Z)V
    .registers 2

    .line 16
    iput-boolean p1, p0, Lcom/hjq/permissions/PermissionFragment;->j:Z

    return-void
.end method

.method public b()V
    .registers 7

    .line 2
    invoke-virtual {p0}, Landroid/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 3
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v0, :cond_bf

    if-nez v1, :cond_e

    goto/16 :goto_bf

    :cond_e
    const-string v2, "request_permissions"

    .line 4
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v2, 0x0

    .line 5
    invoke-static {v0}, Lc/c/b/e;->a(Ljava/util/List;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_ba

    const-string v3, "android.permission.MANAGE_EXTERNAL_STORAGE"

    .line 6
    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    const-string v5, "request_code"

    if-eqz v3, :cond_42

    invoke-static {v1}, Lc/c/b/e;->d(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_42

    .line 7
    invoke-static {}, Lc/c/b/e;->c()Z

    move-result v3

    if-eqz v3, :cond_42

    .line 8
    invoke-static {v1}, Lc/c/b/d;->f(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0}, Landroid/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    const/4 v2, 0x1

    :cond_42
    const-string v3, "android.permission.REQUEST_INSTALL_PACKAGES"

    .line 9
    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_60

    invoke-static {v1}, Lc/c/b/e;->a(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_60

    .line 10
    invoke-static {v1}, Lc/c/b/d;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0}, Landroid/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    const/4 v2, 0x1

    :cond_60
    const-string v3, "android.permission.SYSTEM_ALERT_WINDOW"

    .line 11
    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7e

    invoke-static {v1}, Lc/c/b/e;->e(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_7e

    .line 12
    invoke-static {v1}, Lc/c/b/d;->g(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0}, Landroid/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    const/4 v2, 0x1

    :cond_7e
    const-string v3, "android.permission.NOTIFICATION_SERVICE"

    .line 13
    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9c

    invoke-static {v1}, Lc/c/b/e;->b(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_9c

    .line 14
    invoke-static {v1}, Lc/c/b/d;->c(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0}, Landroid/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    const/4 v2, 0x1

    :cond_9c
    const-string v3, "android.permission.WRITE_SETTINGS"

    .line 15
    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_ba

    invoke-static {v1}, Lc/c/b/e;->c(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_ba

    .line 16
    invoke-static {v1}, Lc/c/b/d;->e(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    const/4 v2, 0x1

    :cond_ba
    if-nez v2, :cond_bf

    .line 17
    invoke-virtual {p0}, Lcom/hjq/permissions/PermissionFragment;->a()V

    :cond_bf
    :goto_bf
    return-void
.end method

.method public b(Landroid/app/Activity;)V
    .registers 2

    .line 1
    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    .line 2
    invoke-virtual {p0}, Landroid/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p3

    if-eqz p2, :cond_29

    if-eqz p3, :cond_29

    const-string v0, "request_code"

    .line 3
    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p3

    if-ne p1, p3, :cond_29

    iget-boolean p1, p0, Lcom/hjq/permissions/PermissionFragment;->i:Z

    if-eqz p1, :cond_19

    goto :goto_29

    :cond_19
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/hjq/permissions/PermissionFragment;->i:Z

    .line 5
    invoke-virtual {p2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    const-wide/16 p2, 0x12c

    invoke-virtual {p1, p0, p2, p3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_29
    :goto_29
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .registers 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SourceLockedOrientationActivity"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/app/Fragment;->onAttach(Landroid/content/Context;)V

    .line 2
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    if-nez p1, :cond_a

    return-void

    .line 3
    :cond_a
    invoke-virtual {p1}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v0

    iput v0, p0, Lcom/hjq/permissions/PermissionFragment;->m:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_14

    return-void

    .line 4
    :cond_14
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_28

    const/4 v0, 0x0

    .line 5
    :try_start_22
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_32

    :catch_26
    move-exception p1

    goto :goto_2f

    :cond_28
    const/4 v1, 0x1

    if-ne v0, v1, :cond_32

    .line 6
    invoke-virtual {p1, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V
    :try_end_2e
    .catch Ljava/lang/IllegalStateException; {:try_start_22 .. :try_end_2e} :catch_26

    goto :goto_32

    .line 7
    :goto_2f
    invoke-virtual {p1}, Ljava/lang/IllegalStateException;->printStackTrace()V

    :cond_32
    :goto_32
    return-void
.end method

.method public onDestroy()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/hjq/permissions/PermissionFragment;->k:Lc/c/b/b;

    return-void
.end method

.method public onDetach()V
    .registers 4

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onDetach()V

    .line 2
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_12

    .line 3
    iget v1, p0, Lcom/hjq/permissions/PermissionFragment;->m:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_f

    goto :goto_12

    .line 4
    :cond_f
    invoke-virtual {v0, v2}, Landroid/app/Activity;->setRequestedOrientation(I)V

    :cond_12
    :goto_12
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 11

    .line 1
    invoke-virtual {p0}, Landroid/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_d6

    if-eqz v0, :cond_d6

    .line 3
    iget-object v2, p0, Lcom/hjq/permissions/PermissionFragment;->k:Lc/c/b/b;

    if-eqz v2, :cond_d6

    const-string v2, "request_code"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    if-eq p1, v0, :cond_1a

    goto/16 :goto_d6

    .line 4
    :cond_1a
    iget-object v0, p0, Lcom/hjq/permissions/PermissionFragment;->k:Lc/c/b/b;

    const/4 v2, 0x0

    .line 5
    iput-object v2, p0, Lcom/hjq/permissions/PermissionFragment;->k:Lc/c/b/b;

    .line 6
    iget-object v3, p0, Lcom/hjq/permissions/PermissionFragment;->l:Lc/c/b/a;

    .line 7
    iput-object v2, p0, Lcom/hjq/permissions/PermissionFragment;->l:Lc/c/b/a;

    const/4 v2, 0x0

    const/4 v4, 0x0

    .line 8
    :goto_25
    array-length v5, p2

    if-ge v4, v5, :cond_90

    .line 9
    aget-object v5, p2, v4

    .line 10
    invoke-static {v5}, Lc/c/b/e;->a(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_37

    .line 11
    invoke-static {v1, v5}, Lc/c/b/e;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    aput v5, p3, v4

    goto :goto_8d

    .line 12
    :cond_37
    invoke-static {}, Lc/c/b/e;->b()Z

    move-result v6

    if-nez v6, :cond_5c

    const-string v6, "android.permission.ACCESS_BACKGROUND_LOCATION"

    .line 13
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_55

    const-string v6, "android.permission.ACTIVITY_RECOGNITION"

    .line 14
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_55

    const-string v6, "android.permission.ACCESS_MEDIA_LOCATION"

    .line 15
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5c

    .line 16
    :cond_55
    invoke-static {v1, v5}, Lc/c/b/e;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    aput v5, p3, v4

    goto :goto_8d

    .line 17
    :cond_5c
    invoke-static {}, Lc/c/b/e;->g()Z

    move-result v6

    if-nez v6, :cond_71

    const-string v6, "android.permission.ACCEPT_HANDOVER"

    .line 18
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_71

    .line 19
    invoke-static {v1, v5}, Lc/c/b/e;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    aput v5, p3, v4

    goto :goto_8d

    .line 20
    :cond_71
    invoke-static {}, Lc/c/b/e;->f()Z

    move-result v6

    if-nez v6, :cond_8d

    const-string v6, "android.permission.ANSWER_PHONE_CALLS"

    .line 21
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_87

    const-string v6, "android.permission.READ_PHONE_NUMBERS"

    .line 22
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8d

    .line 23
    :cond_87
    invoke-static {v1, v5}, Lc/c/b/e;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    aput v5, p3, v4

    :cond_8d
    :goto_8d
    add-int/lit8 v4, v4, 0x1

    goto :goto_25

    .line 24
    :cond_90
    sget-object v4, Lcom/hjq/permissions/PermissionFragment;->n:Landroid/util/ArraySet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v4, p1}, Landroid/util/ArraySet;->remove(Ljava/lang/Object;)Z

    .line 25
    invoke-virtual {p0, v1}, Lcom/hjq/permissions/PermissionFragment;->b(Landroid/app/Activity;)V

    .line 26
    invoke-static {p2, p3}, Lc/c/b/e;->b([Ljava/lang/String;[I)Ljava/util/List;

    move-result-object p1

    .line 27
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    array-length v5, p2

    if-ne v4, v5, :cond_b2

    const/4 p2, 0x1

    if-eqz v3, :cond_ae

    .line 28
    invoke-interface {v3, v1, v0, p1, p2}, Lc/c/b/a;->a(Landroid/app/Activity;Lc/c/b/b;Ljava/util/List;Z)V

    goto :goto_b1

    .line 29
    :cond_ae
    invoke-interface {v0, p1, p2}, Lc/c/b/b;->a(Ljava/util/List;Z)V

    :goto_b1
    return-void

    .line 30
    :cond_b2
    invoke-static {p2, p3}, Lc/c/b/e;->a([Ljava/lang/String;[I)Ljava/util/List;

    move-result-object p2

    if-eqz v3, :cond_c0

    .line 31
    invoke-static {v1, p2}, Lc/c/b/e;->a(Landroid/app/Activity;Ljava/util/List;)Z

    move-result p3

    invoke-interface {v3, v1, v0, p2, p3}, Lc/c/b/a;->b(Landroid/app/Activity;Lc/c/b/b;Ljava/util/List;Z)V

    goto :goto_c7

    .line 32
    :cond_c0
    invoke-static {v1, p2}, Lc/c/b/e;->a(Landroid/app/Activity;Ljava/util/List;)Z

    move-result p3

    invoke-interface {v0, p2, p3}, Lc/c/b/b;->b(Ljava/util/List;Z)V

    .line 33
    :goto_c7
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_d6

    if-eqz v3, :cond_d3

    .line 34
    invoke-interface {v3, v1, v0, p1, v2}, Lc/c/b/a;->a(Landroid/app/Activity;Lc/c/b/b;Ljava/util/List;Z)V

    goto :goto_d6

    .line 35
    :cond_d3
    invoke-interface {v0, p1, v2}, Lc/c/b/b;->a(Ljava/util/List;Z)V

    :cond_d6
    :goto_d6
    return-void
.end method

.method public onResume()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    .line 2
    iget-boolean v0, p0, Lcom/hjq/permissions/PermissionFragment;->j:Z

    if-nez v0, :cond_f

    .line 3
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hjq/permissions/PermissionFragment;->b(Landroid/app/Activity;)V

    return-void

    .line 4
    :cond_f
    iget-boolean v0, p0, Lcom/hjq/permissions/PermissionFragment;->h:Z

    if-eqz v0, :cond_14

    return-void

    :cond_14
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/hjq/permissions/PermissionFragment;->h:Z

    .line 6
    invoke-virtual {p0}, Lcom/hjq/permissions/PermissionFragment;->b()V

    return-void
.end method

.method public run()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Fragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    invoke-virtual {p0}, Lcom/hjq/permissions/PermissionFragment;->a()V

    return-void
.end method
