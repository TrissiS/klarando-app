.class public Lcom/hjq/permissions/PermissionFragment$a;
.super Ljava/lang/Object;
.source "PermissionFragment.java"

# interfaces
.implements Lc/c/b/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hjq/permissions/PermissionFragment;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/app/Activity;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:I

.field public final synthetic d:Lcom/hjq/permissions/PermissionFragment;


# direct methods
.method public constructor <init>(Lcom/hjq/permissions/PermissionFragment;Landroid/app/Activity;Ljava/util/ArrayList;I)V
    .registers 5

    .line 1
    iput-object p1, p0, Lcom/hjq/permissions/PermissionFragment$a;->d:Lcom/hjq/permissions/PermissionFragment;

    iput-object p2, p0, Lcom/hjq/permissions/PermissionFragment$a;->a:Landroid/app/Activity;

    iput-object p3, p0, Lcom/hjq/permissions/PermissionFragment$a;->b:Ljava/util/ArrayList;

    iput p4, p0, Lcom/hjq/permissions/PermissionFragment$a;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;Z)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    if-eqz p2, :cond_20

    .line 1
    iget-object p1, p0, Lcom/hjq/permissions/PermissionFragment$a;->d:Lcom/hjq/permissions/PermissionFragment;

    invoke-virtual {p1}, Landroid/app/Fragment;->isAdded()Z

    move-result p1

    if-nez p1, :cond_b

    goto :goto_20

    .line 2
    :cond_b
    iget-object p1, p0, Lcom/hjq/permissions/PermissionFragment$a;->a:Landroid/app/Activity;

    const-string p2, "android.permission.ACCESS_BACKGROUND_LOCATION"

    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    .line 3
    invoke-static {p2}, Lc/c/b/e;->a([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p2

    const/4 v0, 0x0

    new-instance v1, Lcom/hjq/permissions/PermissionFragment$a$a;

    invoke-direct {v1, p0}, Lcom/hjq/permissions/PermissionFragment$a$a;-><init>(Lcom/hjq/permissions/PermissionFragment$a;)V

    .line 4
    invoke-static {p1, p2, v0, v1}, Lcom/hjq/permissions/PermissionFragment;->a(Landroid/app/Activity;Ljava/util/ArrayList;Lc/c/b/a;Lc/c/b/b;)V

    :cond_20
    :goto_20
    return-void
.end method

.method public b(Ljava/util/List;Z)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/hjq/permissions/PermissionFragment$a;->d:Lcom/hjq/permissions/PermissionFragment;

    invoke-virtual {p1}, Landroid/app/Fragment;->isAdded()Z

    move-result p1

    if-nez p1, :cond_9

    return-void

    .line 2
    :cond_9
    iget-object p1, p0, Lcom/hjq/permissions/PermissionFragment$a;->b:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [I

    const/4 p2, -0x1

    .line 3
    invoke-static {p1, p2}, Ljava/util/Arrays;->fill([II)V

    .line 4
    iget-object p2, p0, Lcom/hjq/permissions/PermissionFragment$a;->d:Lcom/hjq/permissions/PermissionFragment;

    iget v0, p0, Lcom/hjq/permissions/PermissionFragment$a;->c:I

    iget-object v1, p0, Lcom/hjq/permissions/PermissionFragment$a;->b:Ljava/util/ArrayList;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    invoke-virtual {p2, v0, v1, p1}, Lcom/hjq/permissions/PermissionFragment;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    return-void
.end method
