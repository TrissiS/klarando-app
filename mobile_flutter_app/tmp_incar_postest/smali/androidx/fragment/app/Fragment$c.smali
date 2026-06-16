.class public Landroidx/fragment/app/Fragment$c;
.super Ljava/lang/Object;
.source "Fragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/fragment/app/Fragment;->a(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/l/d/w;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/Fragment;Lb/l/d/w;)V
    .registers 3

    .line 1
    iput-object p2, p0, Landroidx/fragment/app/Fragment$c;->h:Lb/l/d/w;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment$c;->h:Lb/l/d/w;

    invoke-virtual {v0}, Lb/l/d/w;->a()V

    return-void
.end method
