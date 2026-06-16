.class public Lb/l/d/t$c;
.super Ljava/lang/Object;
.source "FragmentTransitionImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/t;->a(Landroid/view/ViewGroup;Ljava/util/ArrayList;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Ljava/util/ArrayList;

.field public final synthetic i:Ljava/util/Map;


# direct methods
.method public constructor <init>(Lb/l/d/t;Ljava/util/ArrayList;Ljava/util/Map;)V
    .registers 4

    .line 1
    iput-object p2, p0, Lb/l/d/t$c;->h:Ljava/util/ArrayList;

    iput-object p3, p0, Lb/l/d/t$c;->i:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 1
    iget-object v0, p0, Lb/l/d/t$c;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_23

    .line 2
    iget-object v2, p0, Lb/l/d/t$c;->h:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 3
    invoke-static {v2}, Lb/h/m/y;->B(Landroid/view/View;)Ljava/lang/String;

    move-result-object v3

    .line 4
    iget-object v4, p0, Lb/l/d/t$c;->i:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 5
    invoke-static {v2, v3}, Lb/h/m/y;->a(Landroid/view/View;Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_23
    return-void
.end method
