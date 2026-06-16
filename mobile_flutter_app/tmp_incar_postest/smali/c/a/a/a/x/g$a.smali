.class public Lc/a/a/a/x/g$a;
.super Ljava/lang/Object;
.source "MaterialDatePicker.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/x/g;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/a/a/a/x/g;


# direct methods
.method public constructor <init>(Lc/a/a/a/x/g;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/x/g$a;->h:Lc/a/a/a/x/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 1
    iget-object p1, p0, Lc/a/a/a/x/g$a;->h:Lc/a/a/a/x/g;

    invoke-static {p1}, Lc/a/a/a/x/g;->a(Lc/a/a/a/x/g;)Ljava/util/LinkedHashSet;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/a/a/a/x/h;

    .line 2
    iget-object v1, p0, Lc/a/a/a/x/g$a;->h:Lc/a/a/a/x/g;

    invoke-virtual {v1}, Lc/a/a/a/x/g;->D0()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lc/a/a/a/x/h;->a(Ljava/lang/Object;)V

    goto :goto_a

    .line 3
    :cond_20
    iget-object p1, p0, Lc/a/a/a/x/g$a;->h:Lc/a/a/a/x/g;

    invoke-virtual {p1}, Lb/l/d/c;->x0()V

    return-void
.end method
