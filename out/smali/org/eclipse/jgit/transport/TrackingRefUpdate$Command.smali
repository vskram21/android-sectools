.class final Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;
.super Lorg/eclipse/jgit/transport/ReceiveCommand;
.source "TrackingRefUpdate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TrackingRefUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "Command"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/TrackingRefUpdate;


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)V
    .locals 3
    .parameter

    .prologue
    .line 145
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;->this$0:Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    .line 146
    #getter for: Lorg/eclipse/jgit/transport/TrackingRefUpdate;->oldObjectId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-static {p1}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->access$100(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    #getter for: Lorg/eclipse/jgit/transport/TrackingRefUpdate;->newObjectId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-static {p1}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->access$200(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    #getter for: Lorg/eclipse/jgit/transport/TrackingRefUpdate;->localName:Ljava/lang/String;
    invoke-static {p1}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->access$300(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/eclipse/jgit/transport/ReceiveCommand;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    .line 147
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/transport/TrackingRefUpdate;Lorg/eclipse/jgit/transport/TrackingRefUpdate$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 144
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;-><init>(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)V

    return-void
.end method

.method private decode(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 2
    .parameter "status"

    .prologue
    .line 172
    sget-object v0, Lorg/eclipse/jgit/transport/TrackingRefUpdate$1;->$SwitchMap$org$eclipse$jgit$transport$ReceiveCommand$Result:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 199
    sget-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    :goto_0
    return-object v0

    .line 174
    :pswitch_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;->this$0:Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    #getter for: Lorg/eclipse/jgit/transport/TrackingRefUpdate;->oldObjectId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-static {v0}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->access$100(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;->this$0:Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    #getter for: Lorg/eclipse/jgit/transport/TrackingRefUpdate;->newObjectId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-static {v1}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->access$200(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 175
    sget-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NO_CHANGE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    goto :goto_0

    .line 176
    :cond_0
    sget-object v0, Lorg/eclipse/jgit/transport/TrackingRefUpdate$1;->$SwitchMap$org$eclipse$jgit$transport$ReceiveCommand$Type:[I

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;->getType()Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1

    .line 184
    sget-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->FORCED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    goto :goto_0

    .line 178
    :pswitch_1
    sget-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NEW:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    goto :goto_0

    .line 180
    :pswitch_2
    sget-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->FAST_FORWARD:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    goto :goto_0

    .line 190
    :pswitch_3
    sget-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->REJECTED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    goto :goto_0

    .line 192
    :pswitch_4
    sget-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->REJECTED_CURRENT_BRANCH:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    goto :goto_0

    .line 194
    :pswitch_5
    sget-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->IO_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    goto :goto_0

    .line 172
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch

    .line 176
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method canForceUpdate()Z
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;->this$0:Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    #getter for: Lorg/eclipse/jgit/transport/TrackingRefUpdate;->forceUpdate:Z
    invoke-static {v0}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->access$400(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)Z

    move-result v0

    return v0
.end method

.method public setResult(Lorg/eclipse/jgit/lib/RefUpdate$Result;)V
    .locals 1
    .parameter "status"

    .prologue
    .line 155
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;->this$0:Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    #setter for: Lorg/eclipse/jgit/transport/TrackingRefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    invoke-static {v0, p1}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->access$502(Lorg/eclipse/jgit/transport/TrackingRefUpdate;Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 156
    invoke-super {p0, p1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/lib/RefUpdate$Result;)V

    .line 157
    return-void
.end method

.method public setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V
    .locals 2
    .parameter "status"

    .prologue
    .line 161
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;->this$0:Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;->decode(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v1

    #setter for: Lorg/eclipse/jgit/transport/TrackingRefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    invoke-static {v0, v1}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->access$502(Lorg/eclipse/jgit/transport/TrackingRefUpdate;Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 162
    invoke-super {p0, p1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V

    .line 163
    return-void
.end method

.method public setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V
    .locals 2
    .parameter "status"
    .parameter "msg"

    .prologue
    .line 167
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;->this$0:Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;->decode(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v1

    #setter for: Lorg/eclipse/jgit/transport/TrackingRefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    invoke-static {v0, v1}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->access$502(Lorg/eclipse/jgit/transport/TrackingRefUpdate;Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 168
    invoke-super {p0, p1, p2}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V

    .line 169
    return-void
.end method
