.class public Lb/l/d/r$b;
.super Ljava/lang/Object;
.source "FragmentTransition.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/r;->a(Lb/l/d/t;Ljava/lang/Object;Landroidx/fragment/app/Fragment;Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/l/d/r$b;->h:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/l/d/r$b;->h:Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lb/l/d/r;->a(Ljava/util/ArrayList;I)V

    return-void
.end method
