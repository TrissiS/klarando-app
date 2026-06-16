.class public Lnet/nyx/widget/view/SwitchButton$SavedState$a;
.super Ljava/lang/Object;
.source "SwitchButton.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/nyx/widget/view/SwitchButton$SavedState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lnet/nyx/widget/view/SwitchButton$SavedState;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lnet/nyx/widget/view/SwitchButton$SavedState$a;->createFromParcel(Landroid/os/Parcel;)Lnet/nyx/widget/view/SwitchButton$SavedState;

    move-result-object p1

    return-object p1
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lnet/nyx/widget/view/SwitchButton$SavedState;
    .registers 4

    .line 2
    new-instance v0, Lnet/nyx/widget/view/SwitchButton$SavedState;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lnet/nyx/widget/view/SwitchButton$SavedState;-><init>(Landroid/os/Parcel;Lnet/nyx/widget/view/SwitchButton$a;)V

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lnet/nyx/widget/view/SwitchButton$SavedState$a;->newArray(I)[Lnet/nyx/widget/view/SwitchButton$SavedState;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lnet/nyx/widget/view/SwitchButton$SavedState;
    .registers 2

    .line 2
    new-array p1, p1, [Lnet/nyx/widget/view/SwitchButton$SavedState;

    return-object p1
.end method
