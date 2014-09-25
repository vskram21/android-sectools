.class final Lorg/openintents/openpgp/OpenPgpError$1;
.super Ljava/lang/Object;
.source "OpenPgpError.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/OpenPgpError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lorg/openintents/openpgp/OpenPgpError;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 98
    invoke-virtual {p0, p1}, Lorg/openintents/openpgp/OpenPgpError$1;->createFromParcel(Landroid/os/Parcel;)Lorg/openintents/openpgp/OpenPgpError;

    move-result-object v0

    return-object v0
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lorg/openintents/openpgp/OpenPgpError;
    .locals 5
    .parameter "source"

    .prologue
    .line 100
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 101
    .local v2, parcelableVersion:I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 102
    .local v1, parcelableSize:I
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    .line 104
    .local v3, startPosition:I
    new-instance v0, Lorg/openintents/openpgp/OpenPgpError;

    invoke-direct {v0}, Lorg/openintents/openpgp/OpenPgpError;-><init>()V

    .line 105
    .local v0, error:Lorg/openintents/openpgp/OpenPgpError;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    iput v4, v0, Lorg/openintents/openpgp/OpenPgpError;->errorId:I

    .line 106
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lorg/openintents/openpgp/OpenPgpError;->message:Ljava/lang/String;

    .line 109
    add-int v4, v3, v1

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 111
    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 98
    invoke-virtual {p0, p1}, Lorg/openintents/openpgp/OpenPgpError$1;->newArray(I)[Lorg/openintents/openpgp/OpenPgpError;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lorg/openintents/openpgp/OpenPgpError;
    .locals 1
    .parameter "size"

    .prologue
    .line 115
    new-array v0, p1, [Lorg/openintents/openpgp/OpenPgpError;

    return-object v0
.end method
