.class public Landroidx/activity/result/ActivityResultRegistry$1;
.super Ljava/lang/Object;
.source "ActivityResultRegistry.java"

# interfaces
.implements Lb/n/f;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lb/a/e/a;

.field public final synthetic c:Lb/a/e/e/a;

.field public final synthetic d:Lb/a/e/c;


# virtual methods
.method public a(Lb/n/h;Lb/n/e$b;)V
    .registers 6

    .line 1
    sget-object p1, Lb/n/e$b;->ON_START:Lb/n/e$b;

    invoke-virtual {p1, p2}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_69

    .line 2
    iget-object p1, p0, Landroidx/activity/result/ActivityResultRegistry$1;->d:Lb/a/e/c;

    iget-object p1, p1, Lb/a/e/c;->f:Ljava/util/Map;

    iget-object p2, p0, Landroidx/activity/result/ActivityResultRegistry$1;->a:Ljava/lang/String;

    new-instance v0, Lb/a/e/c$b;

    iget-object v1, p0, Landroidx/activity/result/ActivityResultRegistry$1;->b:Lb/a/e/a;

    iget-object v2, p0, Landroidx/activity/result/ActivityResultRegistry$1;->c:Lb/a/e/e/a;

    invoke-direct {v0, v1, v2}, Lb/a/e/c$b;-><init>(Lb/a/e/a;Lb/a/e/e/a;)V

    invoke-interface {p1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget-object p1, p0, Landroidx/activity/result/ActivityResultRegistry$1;->d:Lb/a/e/c;

    iget-object p1, p1, Lb/a/e/c;->g:Ljava/util/Map;

    iget-object p2, p0, Landroidx/activity/result/ActivityResultRegistry$1;->a:Ljava/lang/String;

    invoke-interface {p1, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3e

    .line 4
    iget-object p1, p0, Landroidx/activity/result/ActivityResultRegistry$1;->d:Lb/a/e/c;

    iget-object p1, p1, Lb/a/e/c;->g:Ljava/util/Map;

    iget-object p2, p0, Landroidx/activity/result/ActivityResultRegistry$1;->a:Ljava/lang/String;

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 5
    iget-object p2, p0, Landroidx/activity/result/ActivityResultRegistry$1;->d:Lb/a/e/c;

    iget-object p2, p2, Lb/a/e/c;->g:Ljava/util/Map;

    iget-object v0, p0, Landroidx/activity/result/ActivityResultRegistry$1;->a:Ljava/lang/String;

    invoke-interface {p2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    iget-object p2, p0, Landroidx/activity/result/ActivityResultRegistry$1;->b:Lb/a/e/a;

    invoke-interface {p2, p1}, Lb/a/e/a;->a(Ljava/lang/Object;)V

    .line 7
    :cond_3e
    iget-object p1, p0, Landroidx/activity/result/ActivityResultRegistry$1;->d:Lb/a/e/c;

    iget-object p1, p1, Lb/a/e/c;->h:Landroid/os/Bundle;

    iget-object p2, p0, Landroidx/activity/result/ActivityResultRegistry$1;->a:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroidx/activity/result/ActivityResult;

    if-eqz p1, :cond_8a

    .line 8
    iget-object p2, p0, Landroidx/activity/result/ActivityResultRegistry$1;->d:Lb/a/e/c;

    iget-object p2, p2, Lb/a/e/c;->h:Landroid/os/Bundle;

    iget-object v0, p0, Landroidx/activity/result/ActivityResultRegistry$1;->a:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 9
    iget-object p2, p0, Landroidx/activity/result/ActivityResultRegistry$1;->b:Lb/a/e/a;

    iget-object v0, p0, Landroidx/activity/result/ActivityResultRegistry$1;->c:Lb/a/e/e/a;

    .line 10
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->f()I

    move-result v1

    .line 11
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->e()Landroid/content/Intent;

    move-result-object p1

    .line 12
    invoke-virtual {v0, v1, p1}, Lb/a/e/e/a;->a(ILandroid/content/Intent;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lb/a/e/a;->a(Ljava/lang/Object;)V

    goto :goto_8a

    .line 13
    :cond_69
    sget-object p1, Lb/n/e$b;->ON_STOP:Lb/n/e$b;

    invoke-virtual {p1, p2}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7b

    .line 14
    iget-object p1, p0, Landroidx/activity/result/ActivityResultRegistry$1;->d:Lb/a/e/c;

    iget-object p1, p1, Lb/a/e/c;->f:Ljava/util/Map;

    iget-object p2, p0, Landroidx/activity/result/ActivityResultRegistry$1;->a:Ljava/lang/String;

    invoke-interface {p1, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8a

    .line 15
    :cond_7b
    sget-object p1, Lb/n/e$b;->ON_DESTROY:Lb/n/e$b;

    invoke-virtual {p1, p2}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8a

    .line 16
    iget-object p1, p0, Landroidx/activity/result/ActivityResultRegistry$1;->d:Lb/a/e/c;

    iget-object p2, p0, Landroidx/activity/result/ActivityResultRegistry$1;->a:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lb/a/e/c;->b(Ljava/lang/String;)V

    :cond_8a
    :goto_8a
    return-void
.end method
