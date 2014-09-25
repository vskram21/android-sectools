.class abstract Lorg/eclipse/jgit/transport/BaseReceivePack$Reporter;
.super Ljava/lang/Object;
.source "BaseReceivePack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/BaseReceivePack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Reporter"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 1427
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract sendString(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
