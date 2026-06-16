.class public Lcom/hjq/permissions/PermissionFragment$a$a;
.super Ljava/lang/Object;
.source "PermissionFragment.java"

# interfaces
.implements Lc/c/b/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hjq/permissions/PermissionFragment$a;->a(Ljava/util/List;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/hjq/permissions/PermissionFragment$a;


# direct methods
.method public constructor <init>(Lcom/hjq/permissions/PermissionFragment$a;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/hjq/permissions/PermissionFragment$a$a;->a:Lcom/hjq/permissions/PermissionFragment$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;Z)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    if-eqz p2, :cond_2e

    .line 1
    iget-object p1, p0, Lcom/hjq/permissions/PermissionFragment$a$a;->a:Lcom/hjq/permissions/PermissionFragment$a;

    iget-object p1, p1, Lcom/hjq/permissions/PermissionFragment$a;->d:Lcom/hjq/permissions/PermissionFragment;

    invoke-virtual {p1}, Landroid/app/Fragment;->isAdded()Z

    move-result p1

    if-nez p1, :cond_d

    goto :goto_2e

    .line 2
    :cond_d
    iget-object p1, p0, Lcom/hjq/permissions/PermissionFragment$a$a;->a:Lcom/hjq/permissions/PermissionFragment$a;

    iget-object p1, p1, Lcom/hjq/permissions/PermissionFragment$a;->b:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [I

    const/4 p2, 0x0

    .line 3
    invoke-static {p1, p2}, Ljava/util/Arrays;->fill([II)V

    .line 4
    iget-object v0, p0, Lcom/hjq/permissions/PermissionFragment$a$a;->a:Lcom/hjq/permissions/PermissionFragment$a;

    iget-object v1, v0, Lcom/hjq/permissions/PermissionFragment$a;->d:Lcom/hjq/permissions/PermissionFragment;

    iget v2, v0, Lcom/hjq/permissions/PermissionFragment$a;->c:I

    iget-object v0, v0, Lcom/hjq/permissions/PermissionFragment$a;->b:Ljava/util/ArrayList;

    new-array p2, p2, [Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/String;

    invoke-virtual {v1, v2, p2, p1}, Lcom/hjq/permissions/PermissionFragment;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    :cond_2e
    :goto_2e
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
    iget-object p1, p0, Lcom/hjq/permissions/PermissionFragment$a$a;->a:Lcom/hjq/permissions/PermissionFragment$a;

    iget-object p1, p1, Lcom/hjq/permissions/PermissionFragment$a;->d:Lcom/hjq/permissions/PermissionFragment;

    invoke-virtual {p1}, Landroid/app/Fragment;->isAdded()Z

    move-result p1

    if-nez p1, :cond_b

    return-void

    .line 2
    :cond_b
    iget-object p1, p0, Lcom/hjq/permissions/PermissionFragment$a$a;->a:Lcom/hjq/permissions/PermissionFragment$a;

    iget-object p1, p1, Lcom/hjq/permissions/PermissionFragment$a;->b:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [I

    const/4 p2, 0x0

    const/4 v0, 0x0

    .line 3
    :goto_17
    iget-object v1, p0, Lcom/hjq/permissions/PermissionFragment$a$a;->a:Lcom/hjq/permissions/PermissionFragment$a;

    iget-object v1, v1, Lcom/hjq/permissions/PermissionFragment$a;->b:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_39

    .line 4
    iget-object v1, p0, Lcom/hjq/permissions/PermissionFragment$a$a;->a:Lcom/hjq/permissions/PermissionFragment$a;

    iget-object v1, v1, Lcom/hjq/permissions/PermissionFragment$a;->b:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "android.permission.ACCESS_BACKGROUND_LOCATION"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_33

    const/4 v1, -0x1

    goto :goto_34

    :cond_33
    const/4 v1, 0x0

    :goto_34
    aput v1, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 5
    :cond_39
    iget-object v0, p0, Lcom/hjq/permissions/PermissionFragment$a$a;->a:Lcom/hjq/permissions/PermissionFragment$a;

    iget-object v1, v0, Lcom/hjq/permissions/PermissionFragment$a;->d:Lcom/hjq/permissions/PermissionFragment;

    iget v2, v0, Lcom/hjq/permissions/PermissionFragment$a;->c:I

    iget-object v0, v0, Lcom/hjq/permissions/PermissionFragment$a;->b:Ljava/util/ArrayList;

    new-array p2, p2, [Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/String;

    invoke-virtual {v1, v2, p2, p1}, Lcom/hjq/permissions/PermissionFragment;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    return-void
.end method
