.class Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;
.super Ljava/lang/Object;
.source "ConfigSnapshot.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/ConfigSnapshot;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SectionNames"
.end annotation


# instance fields
.field final sections:Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;

.field final subsections:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/ConfigSnapshot;)V
    .locals 7
    .parameter "cfg"

    .prologue
    .line 238
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 239
    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    .line 240
    .local v4, sec:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 241
    .local v5, sub:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    :goto_0
    if-eqz p1, :cond_4

    .line 242
    iget-object v6, p1, Lorg/eclipse/jgit/lib/ConfigSnapshot;->entryList:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ConfigLine;

    .line 243
    .local v0, e:Lorg/eclipse/jgit/lib/ConfigLine;
    iget-object v6, v0, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    if-eqz v6, :cond_0

    .line 246
    iget-object v6, v0, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    invoke-static {v6}, Lorg/eclipse/jgit/util/StringUtils;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 247
    .local v2, l1:Ljava/lang/String;
    invoke-interface {v4, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 248
    iget-object v6, v0, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    invoke-interface {v4, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    :cond_1
    iget-object v6, v0, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    if-eqz v6, :cond_0

    .line 253
    invoke-interface {v5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    .line 254
    .local v3, m:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    if-nez v3, :cond_2

    .line 255
    new-instance v3, Ljava/util/LinkedHashSet;

    .end local v3           #m:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    .line 256
    .restart local v3       #m:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v5, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    :cond_2
    iget-object v6, v0, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    invoke-interface {v3, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 260
    .end local v0           #e:Lorg/eclipse/jgit/lib/ConfigLine;
    .end local v2           #l1:Ljava/lang/String;
    .end local v3           #m:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    :cond_3
    iget-object p1, p1, Lorg/eclipse/jgit/lib/ConfigSnapshot;->baseState:Lorg/eclipse/jgit/lib/ConfigSnapshot;

    goto :goto_0

    .line 263
    .end local v1           #i$:Ljava/util/Iterator;
    :cond_4
    new-instance v6, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;

    invoke-direct {v6, v4}, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;-><init>(Ljava/util/Map;)V

    iput-object v6, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;->sections:Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;

    .line 264
    iput-object v5, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;->subsections:Ljava/util/Map;

    .line 265
    return-void
.end method
